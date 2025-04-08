//
//  Play.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 08/04/25.
//


var score: Int = 0

func playGame() {
    guard let trivia: (question: String, answers: [String], correctAnswer: String) = fetchQuestionSync() else {
        fatalError()
    }
    
    print(trivia.question)
    for (i,answer) in trivia.answers.enumerated() {
        print("\(i+1) - \(answer)")
    }
    
    //
    //    //guard var trivia else { fatalError("erro trivia") }
    //    //guard let indexOfCorrectAnswer = arrayQuestions.firstIndex(of: trivia.correctAnswer) else {fatalError("erro index")}
    //    var answerInput: String = ""
    //    print(answerInput)
    //    repeat {
    //
    //
    //
    //        guard var answerInput = readLine() else {return}
    //
    //        /*if(Int(answerInput) == (indexOfCorrectAnswer - 1)){
    //
    //            print("You got it right ✅")
    //            score = score + 10*score
    //
    //        }*/
    //
    //        if let answerInput = Int(answerInput) {
    //
    //            if answerInput > 4 || answerInput < 1 {
    //                print("Please, type a valid input.")
    //            }
    //
    //        } else {
    //
    //            print("Please, type a valid input.")
    //
    //        }
    //
    //    }while (Int(answerInput) == (indexOfCorrectAnswer - 1))
    //
    //    print("Wrong answer. The correct one was \(trivia.correctAnswer)")
    //    print("Your score: \(score)")
    //
    //}
}
