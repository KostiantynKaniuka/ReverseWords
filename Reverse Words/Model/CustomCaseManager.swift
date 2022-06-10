//
//  CustomCaseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 10.06.2022.
//

import UIKit

final class CustomCaseManager {
    func reverseWithoutFilter(FullText:String, TextToIgnore:String) -> String {
        let fullTextArray = FullText.components(separatedBy: " ")
        let textToIgnoreArray = TextToIgnore.components(separatedBy: " ")
        let result = fullTextArray.map{!textToIgnoreArray.contains($0) ? String($0.reversed()) : $0}
        return result.joined(separator: " ")
    }
}
