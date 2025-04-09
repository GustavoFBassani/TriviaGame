//
//  Play.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 08/04/25.
//

import Foundation

var score: Int = 0

func playGame() {
    
    var skipQuestionCounter = 3
    
    while true{
        
        var indexOfCorrectAnswer:Int = 0
        var trivia:(question: String, answers: [String], correctAnswer: String) = ("", [""], "")
        
        guard let triviaFetched = fetchQuestionSync() else {fatalError()}
        sleep(3)
        
        trivia = triviaFetched
        
        guard let indexOfCorrectAnswerGuard = trivia.answers.firstIndex(of: trivia.correctAnswer) else {fatalError("erro index")}
        indexOfCorrectAnswer = indexOfCorrectAnswerGuard
        
        for (i,answer) in trivia.answers.enumerated() {
            if trivia.correctAnswer == answer {
                indexOfCorrectAnswer = i
            }
        }
        
        let line = String(repeating: "═", count: trivia.question.count + 4)
                print("\n╔" + line + "╗")
                print("║  \(trivia.question.htmlDecoded)  ║")
                print("╚" + line + "╝\n")
        
        for (i,answer) in trivia.answers.enumerated() {
            print(" \(i+1)️⃣ - \(answer)")
            
        }
        
        
        if(skipQuestionCounter > 0){
            print("\n5 - Skip question (\(skipQuestionCounter) left)")
        }else {
            print("\nNo more skips available")
        }
        
        guard let answerInput = readLine(), let answerInputInt = Int(answerInput) else {return}
        
        if(answerInputInt == (indexOfCorrectAnswer + 1)){
            print("You got it right ✅")
            score += 10
            
            
        }else if (answerInputInt == 5){
            if  (skipQuestionCounter > 0){
                print("You skipped the question")
                skipQuestionCounter -= 1
                continue
            }
        }else {
            print("\n\nWrong answer ❌\nThe correct one was \(trivia.correctAnswer)")
            break
        }
    }
    
    print("Your score: \(score)")
    var inputSave:String?
    
    repeat{
        
        print("\nDo you want to save your score?\n1 - Yess 🤩\n2 - No 😬")
        
        guard let inputSaveSelected = readLine() else {return}
        inputSave = inputSaveSelected
        
        if inputSave == "1" {
            
            print("What's your nickname?")
            guard let playerName = readLine() else {return}
            
            addRank(name: playerName, score: score)
            
        }else if inputSave == "2"{
            print("The game ended...")
        }else {
            print("Invalid option, please try again")
        }
        
    }while inputSave != "1" && inputSave != "2"
    
    
}
