//
//  generateSound.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 07/04/25.
//

import Foundation
import AVFoundation

func generateSound(fileName:String){
    var audioPlayer: AVAudioPlayer?
    

    
    guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
    let url = URL(string: path.absoluteString + fileName)
    else { return }
    
    
    print(url.absoluteString)
    print(url.relativePath)
    //currentDirectoryPath + "/soundsEffects/\(fileName)"
//    let url = URL(fileURLWithPath: path)
    
//    print(path)
//    print(url)
    
    do {
//        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//        try AVAudioSession.sharedInstance().setActive(true)
        audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = audioPlayer else { return }
        player.play()
    } catch {
        print("There was a erro trying to play the soundtrack \(error.localizedDescription)")
    }
}

