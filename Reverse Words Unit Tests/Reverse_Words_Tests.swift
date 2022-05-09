//
//  Reverse_Words_Tests.swift
//  Reverse Words Tests
//
//  Created by Константин Канюка on 28.04.2022.
//

import XCTest
@testable import Reverse_Words
class Reverse_Words_Tests: XCTestCase {
    
    var sut: ReverseWordsViewController!
    
    override func setUpWithError() throws {
        sut = ReverseWordsViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testIfReverseMethodIsWorking() throws {
        //Given
        let exampleInput = "Test String"
        func reverseWolrdsInSentance(sentanse: String) -> String {
            let sample = exampleInput
            let sampleSentence = sample
            let allWords = sampleSentence.components(separatedBy: " ")
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
        //When
        let inPut = reverseWolrdsInSentance(sentanse: exampleInput)
        let expectedOutput = "tseT gnirtS"
        // Then
        XCTAssertEqual(inPut, expectedOutput)
    }
}
