import UIKit

class ReverseManager  {
    var sampleString: String
    init(sampleString: String) {
        self.sampleString = sampleString
    }
    func reverseString(textToReverse: String) -> String {
        let sample = sampleString
        let sampleSentance = sample
        let allWords = sampleSentance.components(separatedBy: " ")
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
}
