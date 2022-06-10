//
//  ReverseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 16.05.2022.
//

import UIKit

final class DefaultCaseManager {
    private func reverseOnlyLetters_SeparateString(stringElement: String) -> String {
        var result = Array(stringElement)
        var i: Int = 0, j: Int = result.count - 1
          while i < j {
              while i < j { if result[i].isLetter { break }; i += 1 }
              while i < j { if result[j].isLetter { break }; j -= 1 }
              let swap = result[i]; result[i] = result[j]; result[j] = swap
              i += 1; j -= 1
          }
          return String(result)
      }
    
    func reververseText(Fulltext: String) -> String {
        let sampleText = Fulltext
        let sampleArray = sampleText.components(separatedBy: " ")
        let reversedArray = sampleArray.map{reverseOnlyLetters_SeparateString(stringElement: $0)}
        return reversedArray.joined(separator: " ")
    }
    }

