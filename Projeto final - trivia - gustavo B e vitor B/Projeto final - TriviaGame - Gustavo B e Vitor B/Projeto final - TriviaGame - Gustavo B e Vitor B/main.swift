//
//  main.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 07/04/25.
//

import Foundation
import AVFoundation


var invalidMessage:String = ""

func generateMenu(){ //função pra printar o menu
    //print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    print("""
    =================================================================================================================
    
     █████╗  ██████╗ █████╗ ██████╗ ███████╗███╗   ███╗██╗   ██╗███████╗    ████████╗██████╗ ██╗██╗   ██╗██╗ █████╗ 
    ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝██╔════╝    ╚══██╔══╝██╔══██╗██║██║   ██║██║██╔══██╗
    ███████║██║     ███████║██║  ██║█████╗  ██╔████╔██║ ╚████╔╝ ███████╗       ██║   ██████╔╝██║██║   ██║██║███████║
    ██╔══██║██║     ██╔══██║██║  ██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  ╚════██║       ██║   ██╔══██╗██║╚██╗ ██╔╝██║██╔══██║
    ██║  ██║╚██████╗██║  ██║██████╔╝███████╗██║ ╚═╝ ██║   ██║   ███████║       ██║   ██║  ██║██║ ╚████╔╝ ██║██║  ██║
    ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝     ╚═╝   ╚═╝   ╚══════╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝  ╚═╝
    
    1 - PLAY 🎮
    2 - RANKING 🏆
    3 - LEAVE 👋
    
    =================================================================================================================
    \(invalidMessage)                                                                                                                    
    """)
    //generateSound(fileName: "ShowDoMilhaoTema.mp3" )
}

func menuOptions(optionSelected: String){ //função pra controlar as opçoes do menu
    switch optionSelected {
    case "1":
        //função de jogar...
        playGame()
        
    case "2":
        //função pra imprimir o ranking
        getRank()
    default:
        invalidMessage = "Invalid option, please try again ❌"
    }
}

func main(){
    var opt:String
    
    repeat{
        
        generateMenu()
        guard let inputOption = readLine() else {return}
        menuOptions(optionSelected: inputOption)
        opt = inputOption
    }while(opt != "3")
    print("Leaving...")
    
}
addRank(name: "adriel", score: 60)
addRank(name: "gustavo", score: 10)

main()

