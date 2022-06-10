//
//  Reverse_Words_Tests.swift
//  Reverse Words Tests
//
//  Created by Константин Канюка on 28.04.2022.
//

import XCTest
@testable import Reverse_Words

class Reverse_Words_Tests: XCTestCase {
    var sut: DefaultCaseManager!
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testIf_InDefaultCaseTheNubers_Are_Ignored() throws {
        //Given
        sut = DefaultCaseManager()
        let input = "Foxminded cool 24/7"
        let expectedOutput = "dednimxoF looc 24/7"
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIfReverseMethodIsWorking() throws {
        //Given
        sut = DefaultCaseManager()
        let input = "abcd efgh"
        let expectedOutput = "dcba hgfe"
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIfNumbersAreReversed() throws {
        //Given
        sut = DefaultCaseManager()
        let input = "a1bcd efg!h"
        let expectedOutput = "d1cba hgf!e"
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
}
