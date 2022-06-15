//
//  ExceptionCaseTests.swift
//  Reverse Words Tests
//
//  Created by Константин Канюка on 15.06.2022.
//

import XCTest

@testable import Reverse_Words

class ExceptionCaseTests: XCTestCase {
    var sut: ExceptionRuleReverseManager!
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_exeptionReverseManager_IgnoringSelectedSymbols() throws {
        //Given
        sut = ExceptionRuleReverseManager()
        let input = "Foxminded cool 24/7"
        let exclusionCharacters = "xl"
        let expectedOutput = "dexdnimoF oocl 7/42"
        //When
        let reverseAction = sut.reverse(stringWithIgnoreSymbols: input, ignoreSymbols: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func test_exeptionReverseManager_ReversingWithoutExeption() throws {
        //Given
        sut = ExceptionRuleReverseManager()
        let input = "abcd efgh"
        let exclusionCharacters = "xl"
        let expectedOutput = "dcba hgfe"
        //When
        let reverseAction = sut.reverse(stringWithIgnoreSymbols: input, ignoreSymbols: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func test_exeptionReverseManager_IgnoringOneSelectedSymbol() throws {
        //Given
        sut = ExceptionRuleReverseManager()
        let input = "a1bcd efglh"
        let exclusionCharacters = "xl"
        let expectedOutput = "dcb1a hgfle"
        //When
        let reverseAction = sut.reverse(stringWithIgnoreSymbols: input, ignoreSymbols: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func test_exeptionReverseManager_ZebraCase() throws {
        //Given
        sut = ExceptionRuleReverseManager()
        let input = "a1b2c3 d4e5f6"
        let exclusionCharacters = "c5"
        let expectedOutput = "32b1ca 6fe54d"
        //When
        let reverseAction = sut.reverse(stringWithIgnoreSymbols: input, ignoreSymbols: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
}
