//
//  Reverse_Words_Tests.swift
//  Reverse Words Tests
//
//  Created by Константин Канюка on 28.04.2022.
//

import XCTest
@testable import Reverse_Words

class Reverse_Words_Tests: XCTestCase {
    var sutDefault: DefaultCaseManager!
    var sutCustom: CustomCaseManager!
    
    override func tearDownWithError() throws {
        sutDefault = nil
        sutCustom = nil
    }
    
    func testIf_InDefaultCaseTheNubers_Are_Ignored() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "Foxminded cool 24/7"
        let expectedOutput = "dednimxoF looc 24/7"
        //When
        let reverseAction = sutDefault.reververseText(Fulltext: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIf_DefaultCase_ReverseMethodIsWorking() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "abcd efgh"
        let expectedOutput = "dcba hgfe"
        //When
        let reverseAction = sutDefault.reververseText(Fulltext: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIf_DefaultCase_NumbersAreReversed() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "a1bcd efg!h"
        let expectedOutput = "d1cba hgf!e"
        //When
        let reverseAction = sutDefault.reververseText(Fulltext: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIfRuleOfExclusionCharacterSetDataIsWorhing() throws {
        //Given
        sutCustom = CustomCaseManager()
        let input = "Foxminded cool 24/7"
        let exclusionCharacters = "xl"
        let expectedOutput = "dexdnimoF oocl 7/42"
        //When
        let reverseAction = sutCustom.reverseWithoutFilter(fullText: input, textToIgnore: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testCustomReverseMethod_WihoutExclusionCharactersSet() throws {
        //Given
        sutCustom = CustomCaseManager()
        let input = "abcd efgh"
        let exclusionCharacters = "xl"
        let expectedOutput = "dcba hgfe"
        //When
        let reverseAction = sutCustom.reverseWithoutFilter(fullText: input, textToIgnore: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testCustomReverseMethod_CointainOnly_One_ExclusionCharacterFromData() throws {
        //Given
        sutCustom = CustomCaseManager()
        let input = "a1bcd efglh"
        let exclusionCharacters = "xl"
        let expectedOutput = "dcb1a hgfle"
        //When
        let reverseAction = sutCustom.reverseWithoutFilter(fullText: input, textToIgnore: exclusionCharacters)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
}
