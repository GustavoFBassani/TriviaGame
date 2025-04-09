//
//  Play.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 08/04/25.
//

import Foundation

var score: Int = 0

// Efeito de digitação pra demorar um pouquinho pra aprecer
func suspensePrint(_ text: String, delay: useconds_t = 20000, newline: Bool = true) {
    for char in text {
        print(char, terminator: "")
        fflush(stdout)
        usleep(delay)
    }
    if newline { print() }
}

func playGame() {
    
    var skipQuestionCounter = 3 //quantidade de skips q o usuario tem
    
    while true {
        
        var indexOfCorrectAnswer: Int = 0 //index da resposta correta
        var trivia: (question: String, answers: [String], correctAnswer: String) = ("", [""], "") //inicializa o trivia
        
        guard let triviaFetched = fetchQuestionSync() else { fatalError() }
        sleep(1) //sleep pra demorar um tempinho pra mostrar as questões
        
        trivia = triviaFetched
                
        for (i, answer) in trivia.answers.enumerated() { //pega o index da respota correta
            if trivia.correctAnswer == answer {
                indexOfCorrectAnswer = i
            }
        }
        
        // Estilo visual
        let terminalWidth = 140
        func padLine(_ text: String) -> String {
            return "║ " + text + String(repeating: " ", count: max(0, terminalWidth - text.count - 3)) + "║"
        }
        
        print("\n" + String(repeating: "═", count: terminalWidth))
        print("""
         ██████╗██╗  ██╗ █████╗ ██╗     ██╗     ███████╗███╗   ██╗ ██████╗ ███████╗██╗
        ██╔════╝██║  ██║██╔══██╗██║     ██║     ██╔════╝████╗  ██║██╔════╝ ██╔════╝██║
        ██║     ███████║███████║██║     ██║     █████╗  ██╔██╗ ██║██║  ███╗█████╗  ██║
        ██║     ██╔══██║██╔══██║██║     ██║     ██╔══╝  ██║╚██╗██║██║   ██║██╔══╝  ╚═╝
        ╚██████╗██║  ██║██║  ██║███████╗███████╗███████╗██║ ╚████║╚██████╔╝███████╗██╗
         ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝
                                                                                      
        """)
        print("╔" + String(repeating: "═", count: terminalWidth - 2) + "╗")
        
        // Caixa interna da pergunta
        let questionText = trivia.question.htmlDecoded
        let innerLine = String(repeating: "═", count: min(questionText.count + 4, terminalWidth - 8))
        print(padLine("╔" + innerLine + "╗"))
        print(padLine("║  \(questionText)  ║"))
        print(padLine("╚" + innerLine + "╝"))
        print(padLine("")) // Espaço entre pergunta e opções
        
        // Alternativas uma por uma
        for (i, answer) in trivia.answers.enumerated() {
            print(padLine(" \(i+1)️⃣ - \(answer.htmlDecoded)"))
        }
        
        // Skip info (sem suspense)
        if skipQuestionCounter > 0 {
            print(padLine(" 5️⃣ - Skip question (\(skipQuestionCounter) left) "))
        } else {
            print(padLine(" ❌ No more skips available"))
        }
        
        print("╚" + String(repeating: "═", count: terminalWidth - 2) + "╝")
        print(String(repeating: "═", count: terminalWidth) + "\n")
        
        // Input do usuário
        guard let answerInput = readLine(), let answerInputInt = Int(answerInput) else { return }
        
        if answerInputInt == (indexOfCorrectAnswer + 1) { //ve se o input é igual ao index da respota correta
            suspensePrint("✅ You got it right!", delay: 15000)
            score += 10 //adiciona o socre
        } else if answerInputInt == 5 { //se for 5, seleiona o skip
            if skipQuestionCounter > 0 { //ve se tem skips
                print("💨 You skipped the question")
                skipQuestionCounter -= 1 //diminui o counter de skips
                continue
            }
        } else {
            suspensePrint("\n❌ Wrong answer!", delay: 20000) //questao errada (ou alternativa invalida)
            suspensePrint("👉 The correct one was: \(trivia.correctAnswer)", delay: 20000)
            break
        }
    }
    
    suspensePrint("🏁 Your final score: \(score)\n", delay: 15000)
    var inputSave: String?
    
    repeat {
        print("💾 Do you want to save your score?\n1 - Yess 🤩\n2 - No 😬")
        
        guard let inputSaveSelected = readLine() else { return } //input do usuario pra salvar
        inputSave = inputSaveSelected
        
        if inputSave == "1" {
            print("👤 What's your nickname?")
            guard let playerName = readLine() else { return }
            addRank(name: playerName, score: score) //salva no rank com o nome dado
        } else if inputSave == "2" {
            print("👋 The game ended...")
        } else {
            print("❗ Invalid option, please try again")
        }
        
    } while inputSave != "1" && inputSave != "2" //enquanto for uma resposta válida
}
