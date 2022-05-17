//
//  ViewController.swift
//  Reverse Words
//
//  Created by Константин Канюка on 18.03.2022.
//

import UIKit


final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var reverseTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseTextField.delegate = self
        reverseTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        reverseButton.setTitle("Reverse", for: .normal)
        reverseTextField.endEditing(true)
        return true
    }// changing reverseButton label after user tapped return button on keyboard
    
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
        ) -> Bool {
        reverseButton.setTitle("Reverse", for: .normal)
        return true
    }
    
    private func reverseWolrdsInSentance(sentanse: String) -> String {
        let sample = reverseTextField.text ?? ""
        let sampleSentence = sample
        let allWords = sampleSentence.components(separatedBy: " ")
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
    
    @IBAction func reverseButtonTapped(_ sender: UIButton) {
        let sample = reverseTextField.text ?? ""
        let sampleSentence = sample
        if resultLabel.text?.count == reverseTextField.text?.count {
            self.reverseTextField.text = nil
            self.resultLabel.text = nil
            reverseButton.setTitle("Reverse", for: .normal)
        } else if resultLabel.text?.count != reverseTextField.text?.count {
            resultLabel.text = reverseWolrdsInSentance(sentanse: sampleSentence)
            reverseButton.setTitle("Clear", for: .normal)
        }
    }
}


        



    
        
    
    


