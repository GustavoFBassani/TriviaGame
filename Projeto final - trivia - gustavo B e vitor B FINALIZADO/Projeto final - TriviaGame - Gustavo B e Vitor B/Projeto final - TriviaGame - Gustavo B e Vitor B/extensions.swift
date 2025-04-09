//
//  extensions.swift
//  Projeto final - TriviaGame - Gustavo B e Vitor B
//
//  Created by ticpucrs on 09/04/25.
//
import Foundation

extension String {
    var htmlDecoded: String {
        var result = self
        let entities: [String: String] = [
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
            "&uacute;": "ú"
        ]

        for (entity, character) in entities {
            result = result.replacingOccurrences(of: entity, with: character)
        }

        return result
    }
}

extension Character {
    var isEmoji: Bool {
        return unicodeScalars.first?.properties.isEmojiPresentation ?? false
    }
}



