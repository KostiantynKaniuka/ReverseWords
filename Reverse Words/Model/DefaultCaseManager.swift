//
//  ReverseManager.swift
//  Reverse Words
//
//  Created by Константин Канюка on 16.05.2022.
//

import UIKit

final class DefaultCaseManager {
    func reverseString(textToReverse: String) -> String {
        let components = textToReverse.components(separatedBy: " ")
        let reversedComponents = components.map{Int($0) != nil ? String($0.reversed()) : $0}
        return reversedComponents.joined(separator: " ")
    }
}
