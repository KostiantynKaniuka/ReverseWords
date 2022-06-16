//
//  ViewController.swift
//  Reverse Words
//
//  Created by Константин Канюка on 18.03.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var ignoreTextField: UITextField!
    @IBOutlet var middleView: UIView!
    @IBOutlet var switchControl: UISegmentedControl!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var reverseTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var defaultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseTextField.delegate = self
        ignoreTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resultButton.setTitle("Result", for: .normal)
        reverseTextField.endEditing(true)
        ignoreTextField.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {
        resultButton.setTitle("Result", for: .normal)
        return true
    }
    
    @IBAction func resultButtonTapped() {
        let filterElement = ExceptionRuleReverseManager()
        let reverseManager = DefaultCaseManager()
        switch switchControl.selectedSegmentIndex {
        case 0:
            if resultLabel.text?.count == reverseTextField.text?.count {
                self.reverseTextField.text = nil
                self.resultLabel.text = nil
                resultButton.setTitle("Result", for: .normal)
            } else if resultLabel.text?.count != reverseTextField.text?.count {
                resultLabel.text = reverseManager.reversed(string:
                reverseTextField.text ?? "")
                resultButton.setTitle("Clear", for: .normal)
            }
        case 1:
            filterElement.exceptionElements = ignoreTextField.text ?? ""
            if resultLabel.text?.count == reverseTextField.text?.count {
                self.reverseTextField.text = nil
                self.resultLabel.text = nil
                self.ignoreTextField.text = nil
                resultButton.setTitle("Result", for: .normal)
            } else if resultLabel.text?.count != reverseTextField.text?.count {
                resultLabel.text = filterElement.reverse(string: reverseTextField.text ?? "")
                resultButton.setTitle("Clear", for: .normal)
            }
        default:
            break
        }
    }
    
    @IBAction func switchCase(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            middleView.bringSubviewToFront(defaultView)
            resultButton.setTitle("Result", for: .normal)
            self.resultLabel.text = nil
        case 1:
            middleView.bringSubviewToFront(ignoreTextField)
            resultButton.setTitle("Result", for: .normal)
            self.resultLabel.text = nil
        default:
            break
        }
    }
}








    
        
    
    


