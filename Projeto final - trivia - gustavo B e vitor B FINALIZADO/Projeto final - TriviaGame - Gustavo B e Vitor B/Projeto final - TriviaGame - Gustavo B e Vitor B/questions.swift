//
//  Questions.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 08/04/25.

import Foundation

//Questoes
struct Question: Codable {
    let responseCode: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

struct Result: Codable {
    let type, difficulty, category, question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

func fetchQuestionSync() -> (question: String, answers: [String], correctAnswer:String)? {
    let urlString = "https://opentdb.com/api.php?amount=1&difficulty=easy&type=multiple" //pega o url
    
    guard let url = URL(string: urlString) else { return nil } //converte pra url mesmo

    var result: (String, [String], String)? = nil //cria nossa tripla result
    let semaphore = DispatchSemaphore(value: 0) //nosso semaphore

    let task = URLSession.shared.dataTask(with: url) { data, response, error in //começa session
        defer { semaphore.signal() }

        if let error = error { //verifica error
            print("Error fetching question: \(error.localizedDescription)")
            return
        }

        guard let data = data else { return } //verfica data

        do {
            guard let trivia = try JSONDecoder().decode(Question.self, from: data).results.first else {fatalError("No valaid question received \(error?.localizedDescription)") } //decodar a questao

            var answers = trivia.incorrectAnswers
            answers.append(trivia.correctAnswer)
            answers.shuffle() //embaralha o array das alternativas
            
            
            result = (trivia.question, answers, trivia.correctAnswer) //coloca tudo num result
            
            
        } catch {
            print("Decoding error: \(error.localizedDescription)")
        }
    }

    task.resume() // task é executada
    semaphore.wait() //pede pro semaforo esperar o codigo rodas

    return result
}
