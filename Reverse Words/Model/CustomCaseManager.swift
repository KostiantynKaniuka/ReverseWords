//
//  CustomCaseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 10.06.2022.
//

import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

final class CustomCaseManager {
    func reverseWithoutFilter(fullText: String, textToIgnore: String) -> String {
        let fullTextArray = fullText.components(separatedBy: " ")
        var posOfChars : [[String:[Int]]] = []
        for (i, comp) in fullTextArray.enumerated() {
            posOfChars.append( [:] )
            for c in textToIgnore {
                for (pos, charInComp) in comp.enumerated() {
                    if charInComp == c {
                        if posOfChars[i][String(c)] == nil {
                            posOfChars[i][String(c)] = [pos]
                        } else {
                            posOfChars[i][String(c)]!.append(pos)
                        }
                    }
                }
            }
        }
        var newTextArray = fullTextArray
        for (i, _) in fullTextArray.enumerated() {
            for c in textToIgnore {
                newTextArray[i] = newTextArray[i].replacingOccurrences(of: String(c), with: "")
            }
        }
        newTextArray = newTextArray.map() { String($0.reversed()) }
        for i in 0..<newTextArray.count {
            for toRestore in posOfChars[i] {
                let str = toRestore.key
                let firstChar = str[0]
                for pos in toRestore.value {
                    let posIndex = newTextArray[i].index(newTextArray[i].startIndex, offsetBy: pos)
                    newTextArray[i].insert(firstChar, at: posIndex)
                }
            }
        }
        return newTextArray.joined(separator: " ")
    }
}

