import XCTest

class Reverse_WordsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_String_Input_And_Result_Check() throws {
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


