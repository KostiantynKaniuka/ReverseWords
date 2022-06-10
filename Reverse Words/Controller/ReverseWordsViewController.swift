//
//  ViewController.swift
//  Reverse Words
//
//  Created by Константин Канюка on 18.03.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var ignoreTextField: UITextField!
    @IBOutlet var midleView: UIView!
    @IBOutlet var switchControl: UISegmentedControl!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var reverseTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var defaultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseTextField.delegate = self
        reverseTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resultButton.setTitle("Result", for: .normal)
        reverseTextField.endEditing(true)
        return true
    }// changing reverseButton label after user tapped return button on keyboard
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {
        resultButton.setTitle("Result", for: .normal)
        return true
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        let filterElement = CustomCaseManager()
        let reverseManager = DefaultCaseManager()
        if switchControl.selectedSegmentIndex == 1 {
            let stringToFilter = filterElement.reverseWithoutFilter(FullText: reverseTextField.text ?? "", TextToIgnore: ignoreTextField.text ?? "")
            if resultLabel.text?.count == reverseTextField.text?.count {
                self.reverseTextField.text = nil
                self.resultLabel.text = nil
                self.ignoreTextField.text = nil
                resultButton.setTitle("Result", for: .normal)
            } else if resultLabel.text?.count != reverseTextField.text?.count {
                resultLabel.text = stringToFilter
                resultButton.setTitle("Clear", for: .normal)
            }
        } else if switchControl.selectedSegmentIndex == 0 {
            if resultLabel.text?.count == reverseTextField.text?.count {
                self.reverseTextField.text = nil
                self.resultLabel.text = nil
                resultButton.setTitle("Result", for: .normal)
            } else if resultLabel.text?.count != reverseTextField.text?.count {
                resultLabel.text = reverseManager.reververseText(Fulltext: reverseTextField.text ?? "")
                resultButton.setTitle("Clear", for: .normal)
            }
        }
    }
    
    @IBAction func switchCase(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            midleView.bringSubviewToFront(defaultView)
        case 1:
            midleView.bringSubviewToFront(ignoreTextField)
        default:
            break
        }
    }
}








    
        
    
    


