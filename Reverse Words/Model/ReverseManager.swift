//
//  ReverseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 16.05.2022.
//

import UIKit

final class ReverseManager {
    private var sampleString: String
    init(sampleString: String) {
        self.sampleString = sampleString
    }
    
    func reverseString(textToReverse: String) -> String {
        let sample = sampleString
        let sampleSentance = sample
        let allWords = sampleSentance.components(separatedBy: " ")
        var newSentence = ""
        for word in allWords {
            if newSentence != "" {
                newSentence += " "
            }
            let reverseWord = String(word.reversed())
            newSentence += reverseWord
        }
        return newSentence
    }
}
