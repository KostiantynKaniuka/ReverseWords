//
//  Reverse_WordsUITests.swift
//  Reverse WordsUITests
//
//  Created by Константин Канюка on 09.05.2022.
//

import XCTest

class Reverse_WordsUITests: XCTestCase {
    
    func test_DefaultCase_ReverseInputText() throws {
        //Given
        let app = XCUIApplication()
        app.launch()
        let textToReverseTextField = app.textFields["Text to reverse"]
        let expectedResult = app.staticTexts["ahollA 123"]
        //When
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Alloha 123")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Result"].tap()
        //Then
        XCTAssertTrue(expectedResult.exists)
    }
    
    func test_CustomCase_ExclusionRule() throws {
        //Given
        let app = XCUIApplication()
        app.launch()
        let textToReverseTextField = app.textFields["Text to reverse"]
        let textToIgnoreTextField = app.textFields["Text to ignore "]
        let expectedResult = app.staticTexts["Aaholl 321"]
        //When
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Alloha 123")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textToIgnoreTextField.tap()
        textToIgnoreTextField.typeText("A2")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Result"]/*[[".buttons[\"Result\"].staticTexts[\"Result\"]",".staticTexts[\"Result\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //Then
        XCTAssertTrue(expectedResult.exists)
    }
} 



