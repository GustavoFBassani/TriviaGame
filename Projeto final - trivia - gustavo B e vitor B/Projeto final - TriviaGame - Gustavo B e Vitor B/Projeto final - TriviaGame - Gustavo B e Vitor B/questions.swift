//
//  Questions.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 08/04/25.

import Foundation

//array das alternativas
var arrayQuestions:[String] = []

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

//variavel global pro trivia
var trivia:Result? = nil
//
//func fectchQuestion(){
//    //url com a pergunta da trivia
//    let urlString = "https://opentdb.com/api.php?amount=1&difficulty=easy&type=multiple"
//    
//    //converte a string da url em URL mesmo
//    guard let url = URL(string: urlString) else {return}
//    
//    //inicia  asessão com a url, como uma pesquisa na internet do link
//    let task = URLSession.shared.dataTask(with: url) {data, response,error in //parametros da funçã, data com a informação, response error
//        
//        //ve se tem erro
//        if let error {
//            
//            print("There was an error fecthing the question \(error.localizedDescription)")
//        }
//        
//        //ve se tem data
//        guard let data else {return}
//        
//        do{
//            //decoda a data e guarda na variavel trivia, já pega o primeiro (unico) elemento do array de resultados
//            guard var trivia = try JSONDecoder().decode(Question.self,from: data).results.first else {return}
//            print(trivia.question)
//            arrayQuestions = []
//            
//            for answer in trivia.incorrectAnswers {
//                arrayQuestions.append(answer)
//            }
//            arrayQuestions.append(trivia.correctAnswer)
//            print(arrayQuestions.shuffled())
//        }catch { //algumn erro acontece
//            print("There was an error fecthing the question \(error.localizedDescription)")
//        }
//        
//    }
//    
//    task.resume()
//}






func fetchQuestionSync() -> (question: String, answers: [String], correctAnswer:String)? {
    let urlString = "https://opentdb.com/api.php?amount=1&difficulty=easy&type=multiple"
    
    guard let url = URL(string: urlString) else { return nil }

    var result: (String, [String], String)? = nil
    let semaphore = DispatchSemaphore(value: 0)

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        defer { semaphore.signal() }

        if let error = error {
            print("Error fetching question: \(error.localizedDescription)")
            return
        }

        guard let data = data else { return }

        do {
            guard let trivia = try JSONDecoder().decode(Question.self, from: data).results.first else { return }

            var answers = trivia.incorrectAnswers
            answers.append(trivia.correctAnswer)
            answers.shuffle()
            
            
            result = (trivia.question, answers, trivia.correctAnswer)
            
            
        } catch {
            print("Decoding error: \(error.localizedDescription)")
        }
    }

    task.resume()
    semaphore.wait()

    return result
}
