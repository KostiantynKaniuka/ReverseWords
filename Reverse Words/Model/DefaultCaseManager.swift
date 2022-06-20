//
//  ReverseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 16.05.2022.
//

import UIKit

final class DefaultCaseManager {
    private func reverseOnlyLettersSeparateString(stringElement: String) -> String {
        var result = Array(stringElement)
        var i: Int = 0
        var j: Int = result.count - 1
        while i < j {
            guard result[i].isLetter else {
                i += 1
                continue
            }
            guard result[j].isLetter else {
                j -= 1
                continue
            }
            result.swapAt(i, j)
            i += 1
            j -= 1
        }
        return String(result)
    }
    
    func reversed(string: String) -> String {
        let sampleText = string
        let sampleArray = sampleText.components(separatedBy: " ")
        let reversedArray = sampleArray.map{reverseOnlyLettersSeparateString(stringElement: $0)}
        return reversedArray.joined(separator: " ")
    }
}

