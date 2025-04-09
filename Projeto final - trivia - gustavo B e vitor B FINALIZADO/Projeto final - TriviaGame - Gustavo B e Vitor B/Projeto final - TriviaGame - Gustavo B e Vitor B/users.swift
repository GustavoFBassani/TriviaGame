//
//  users.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 07/04/25.
//

import Foundation

// Dicionário de rank
var rank: [String: Int] = [:]

// Função para adicionar score ao rank
func addRank(name: String, score: Int) {
    var rank = UserDefaults.standard.dictionary(forKey: "rank") as? [String: Int] ?? [:] //pega o dicionario do rank antigo
    rank.updateValue(score, forKey: name) //updatevalue no dicionario antigo
    UserDefaults.standard.set(rank, forKey: "rank") //coloca no userdefaults o novo diiconario de ranl
    
    print("You'r score was sucessfuly saved! 😊")
}

// Função para buscar o rank salvo
func getRank() {
    if let ranking = UserDefaults.standard.dictionary(forKey: "rank")  { //pega o ranking do user defaults
        
        let rankingToOrder:[String:Int] = ranking as? [String:Int] ?? [:]
        let orderedRanking = rankingToOrder.sorted { $0.value > $1.value} //ordena o ranking por pontuação
        
        var opt:String = ""
        
        repeat{
            print("""
                ===============================================================
                    ██████╗  █████╗ ███╗   ██╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
                    ██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝██║████╗  ██║██╔════╝ 
                    ██████╔╝███████║██╔██╗ ██║█████╔╝ ██║██╔██╗ ██║██║  ███╗
                    ██╔══██╗██╔══██║██║╚██╗██║██╔═██╗ ██║██║╚██╗██║██║   ██║
                    ██║  ██║██║  ██║██║ ╚████║██║  ██╗██║██║ ╚████║╚██████╔╝
                    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                ===============================================================                                             
                """)
            
            for (i,(name,score)) in orderedRanking.enumerated() { //printa todos os usuários do rank
                if i == 0{
                    print("🏆 \(i+1)º \(name) - \(score)")
                }else if i == 1 {
                    print("🥈 \(i+1)º \(name) - \(score)")
                }else if i == 2 {
                    print("🥉 \(i+1)º \(name) - \(score)")
                }else{
                    print("\(i+1)º \(name) - \(score)")
                }
                
            }
            print("==============================================================")
            print("\n\n⬅️ Type 1 to leave the rank")
            
            if let inputOption = readLine() { //input de opção de sair do ranking
                opt = inputOption
            }
            
        }while(opt != "1") //fica no ranking enquanto o usuário não escolher sair
        
    }
}
