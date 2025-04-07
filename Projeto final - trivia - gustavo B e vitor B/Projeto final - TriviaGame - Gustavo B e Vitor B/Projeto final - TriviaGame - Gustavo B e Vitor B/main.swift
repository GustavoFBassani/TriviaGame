//
//  main.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 07/04/25.
//

import Foundation
import AVFoundation

var invalidMessage:String = ""

func generateMenu(){
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
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

func menuOptions(optionSelected: String){
    switch optionSelected {
    //case "1":
        //função de jogar...
    case "2":
        showUsersRank()
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

main()
