import XCTest
@testable import Reverse_Words

class Reverse_Words_Tests: XCTestCase {
    var sut: ReverseManager!
    
    override func setUpWithError() throws {
        sut = ReverseManager.init(sampleString: "")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testReverseCaseOne() throws {
        //Given
        let input = "Test String"
        let expectedOutput = "tseT gnirtS"
        sut.sampleString = input
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertEqual(expectedOutput, reverseAction)
    }
    
    func testReverseCaseTwo() throws {
        //Given
        let input = "Alpha Omega"
        let expectedOutput = "ahplA agemO"
        sut.sampleString = input
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
         XCTAssertTrue(expectedOutput == reverseAction)
    }
    
    func testReverseCaseThree() throws {
        //Given
        let input = "Alpha Omega"
        sut.sampleString = input
        //When
        let reverseAction = sut.reverseString(textToReverse: input)
        //Then
        XCTAssertFalse(input == reverseAction)
    }
}
