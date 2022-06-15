//
//  Reverse_Words_Tests.swift
//  Reverse Words Tests
//
//  Created by Константин Канюка on 28.04.2022.
//

import XCTest
@testable import Reverse_Words

class DefaultCaseTests: XCTestCase {
    var sutDefault: DefaultCaseManager!
    
    override func tearDownWithError() throws {
        sutDefault = nil
    }
    
    func test_defaultReverseManager_IgnoresNumbers() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "Foxminded cool 24/7"
        let expectedOutput = "dednimxoF looc 24/7"
        //When
        let reverseAction = sutDefault.reversed(string: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testIf_defaultReverseManager_ReversesingLetters() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "abcd efgh"
        let expectedOutput = "dcba hgfe"
        //When
        let reverseAction = sutDefault.reversed(string: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func test_defaultReverseManager_ReversingOtherSymbols() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "a1bcd efg!h"
        let expectedOutput = "d1cba hgf!e"
        //When
        let reverseAction = sutDefault.reversed(string: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func test_defaultReverseManager_ZebraCase() throws {
        //Given
        sutDefault = DefaultCaseManager()
        let input = "a1b2c3 d4e5f6"
        let expectedOutput = "c1b2a3 f4e5d6"
        //When
        let reverseAction = sutDefault.reversed(string: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
}
