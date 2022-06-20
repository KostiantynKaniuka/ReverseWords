//
//  CustomCaseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 10.06.2022.
//

import UIKit

final class ExceptionRuleReverseManager {
    var exceptionElements = String()
    
    func reverse(string: String) -> String {
        let words = string.components(separatedBy: " ")
        var result = [String]()
        for word in words {
            result.append(rearrangeWord(word))
        }
        return String(result.joined(separator: " "))
    }
    
    private func rearrangeWord(_ word: String) -> String {
        var arrayOfCharacters = Array(word)
        if var firstElementIndex = arrayOfCharacters.indices.first,
           var secondElementIndex = arrayOfCharacters.indices.last {
            while firstElementIndex < secondElementIndex {
                if isException(element: word[firstElementIndex]) {
                    firstElementIndex += 1
                } else if isException(element: word[secondElementIndex]) {
                    secondElementIndex -= 1
                } else {
                    arrayOfCharacters.swapAt(firstElementIndex, secondElementIndex)
                    firstElementIndex += 1
                    secondElementIndex -= 1
                }
            }
        }
        return String(arrayOfCharacters)
    }
    
    private func isException(element: String.Element) -> Bool {
        return exceptionElements.contains(element)
    }
}

private extension String {
    subscript (index: Int) -> String.Element {
        let stringIndex = self.index(self.startIndex, offsetBy: index)
        return self[stringIndex]
    }
}



