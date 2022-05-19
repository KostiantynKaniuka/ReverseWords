//
//  Reverse_WordsUITests.swift
//  Reverse WordsUITests
//
//  Created by Константин Канюка on 09.05.2022.
//

import XCTest

class Reverse_WordsUITests: XCTestCase {
    
    func test_ReverseButton_ReverseInputText() throws {
        //Given
        let app = XCUIApplication()
        app.launch()
        let textToReverseTextField = app.textFields["Text to reverse"]
        let reverseButton = app.buttons["Reverse"]
        let expectedresult = app.staticTexts["tseT gnirtS"]
        //When
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Test String")
        app.keyboards.buttons["Return"].tap()
        reverseButton.tap()
        //Then
        XCTAssertTrue(expectedresult.exists)
    }
}


