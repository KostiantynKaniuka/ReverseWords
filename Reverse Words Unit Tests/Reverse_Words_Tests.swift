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
    
    func testIfReverseOfInput_IsMatchWith_ExpectedOutput() throws {
        //Given
        let input = "Test String"
        sut = DefaultCaseManager(sampleString: input)
        let expectedOutput = "tseT gnirtS"
        //When
        let reverseAction = sut.reverseString(textToReverse:input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIfReverseMethodIsWorking_WithMixSymbols() throws {
        //Given
        let input = "MoSqU1Tooo0"
        let expectedOutput = "0oooT1UqSoM"
        sut = DefaultCaseManager(sampleString: input)
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIfNumbersAreReversed() throws {
        //Given
        let input = "4201620"
        let expectedOutput = "0261024"
        sut = DefaultCaseManager(sampleString: input)
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
}
