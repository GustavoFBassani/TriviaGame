//
//  extensions.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 09/04/25.
//
import Foundation

extension String {
    var htmlDecoded: String { //extensao de string pra decodar o html
        var result = self
        let entities: [String: String] = [ //possiveis textos html
            "&quot;": "\"",
            "&apos;": "'",
            "&amp;": "&",
            "&lt;": "<",
            "&gt;": ">",
            "&#039;": "'",
            "&ldquo;":"\"",
            "&rsquo;": "’",
            "&aacute;": "á",
            "&eacute;": "é",
            "&iacute;": "í",
            "&oacute;": "ó",
            "&uacute;": "ú",
            "&rdquo;":"”"
        ]

        for (entity, character) in entities {
            result = result.replacingOccurrences(of: entity, with: character) //substitui  o texto
        }

        return result
    }
}





