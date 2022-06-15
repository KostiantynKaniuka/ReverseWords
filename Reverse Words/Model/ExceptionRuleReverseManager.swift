//
//  CustomCaseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 10.06.2022.
//

import UIKit

final class ExceptionRuleReverseManager {
    
    func reverse(stringWithIgnoreSymbols: String, ignoreSymbols: String) -> String {
        let fullTextArray = stringWithIgnoreSymbols.components(separatedBy: " ")
        var wordsPositions: [[String:[Int]]] = []
        for (index, word) in fullTextArray.enumerated() {
            wordsPositions.append([:])
            for ignoredCharacter in ignoreSymbols {
                for (pos, charInComp) in word.enumerated() {
                    if charInComp == ignoredCharacter {
                        if wordsPositions[index][String(ignoredCharacter)] == nil {
                            wordsPositions[index][String(ignoredCharacter)] = [pos]
                        } else {
                            wordsPositions[index][String(ignoredCharacter)]!.append(pos)
                        }
                    }
                }
            }
        }
        var newTextArray = fullTextArray
        for (i, _) in fullTextArray.enumerated() {
            for ignoredCharacter in ignoreSymbols {
                newTextArray[i] = newTextArray[i].replacingOccurrences(of: String(ignoredCharacter), with: "")
            }
        }
        newTextArray = newTextArray.map() { String($0.reversed()) }
        for i in 0..<fullTextArray.count {
            var orderedArray = [(Int, String)] ()
            for toRestore in wordsPositions[i] {
                for item in toRestore.value {
                    orderedArray.append((item, toRestore.key))
                }
                orderedArray = orderedArray.sorted() { $0.0 < $1.0 }
            }
            for (index, str) in orderedArray {
                let posIndex = newTextArray[i].index(newTextArray[i].startIndex, offsetBy: index)
                let char = str[0]
                newTextArray[i].insert(char, at: posIndex)
            }
        }
        return newTextArray.joined(separator: " ")
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

