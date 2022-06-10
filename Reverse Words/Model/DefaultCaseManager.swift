//
//  ReverseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 16.05.2022.
//

import UIKit

final class DefaultCaseManager {
    func reverseString(textToReverse: String) -> String {
        let fullTextArray = textToReverse.components(separatedBy: " ")
        let textToIgnore = textToReverse.trimmingCharacters(in: CharacterSet(charactersIn: "1234567890.!@#$%^&*()_+№:;[]-=<>,/"))
        let filter = textToIgnore.components(separatedBy: " ")
        let result = fullTextArray.map{filter.contains($0) ? String($0.reversed()) : $0}
        return result.joined(separator: " ")
    }
}
