//
//  users.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 07/04/25.
//

import Foundation

struct MyData: Codable { //cria um strcut Mydata, q define como vai ser os nossos dados
    var rank: [String: Int] //tem o parametro rank
}

func saveUserInRank(userName:String, score: Int) {
    //var userRank = UserDefaults.standard.data(forKey: "rank")
    var currentRank:[String:Int] = [:]
    //let myData = MyData(rank: [userName:score]) //pra criar um novo usuario, a gente chamauma instancia de MyData
    
    do {
        if let data = UserDefaults.standard.data(forKey: "rank"){ //pega o data antigo
            let oldData = try JSONDecoder().decode(MyData.self, from: data) //decodifica o rank
            currentRank = oldData.rank
        }
        //let data = try JSONEncoder().encode(myData) //a gente codifica a data q a gente criou usando JSONEnconder().enconde()
        //UserDefaults.standard.set(data, forKey: "rank") //salva o dicionario q  agente converteu num data com a chave rank
    } catch {
        print(error.localizedDescription) //pega o erro
    }
    
    currentRank[userName] = score //adiciona novo
    
    do{
        let updatedData = MyData(rank: currentRank)
        let data = try JSONEncoder().encode(updatedData)
        UserDefaults.standard.set(data, forKey: "rank")
    }catch{
        print(error.localizedDescription)
    }
}

func showUsersRank() {
    
    
    guard let data = UserDefaults.standard.data(forKey: "rank") else { return } //pega a data q a gente tem salva no User default na chave rank e salva na variavel data pra ver se existe
        
    do {
        let myData = try JSONDecoder().decode(MyData.self, from: data) //apartir do data q a gente pegou no userDefautlt, a gente usa o JSONDecoder().decode pra decodificar a data q a gente tem guardada, q tem q ser do tipo MyData.self(A struct q a gente fez la em cima, e pega a variavel data, q é onde ta guardado nosso data codificado)
        
        for (username, score) in myData.rank { //usa o for pra iterar sobre o myData.rank,  q vai ser nossa lista do ranl
            print(username, " - ", score)
        }
        
    } catch {
        print(error.localizedDescription)
    }
        
    
}

