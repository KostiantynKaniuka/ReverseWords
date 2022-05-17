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
    
    @IBAction func reverseButtonTapped(_ sender: UIButton) {
        let sampletext = ReverseManager(sampleString: reverseTextField.text ?? "")
        if resultLabel.text?.count == reverseTextField.text?.count {
            self.reverseTextField.text = nil
            self.resultLabel.text = nil
            reverseButton.setTitle("Reverse", for: .normal)
        } else if resultLabel.text?.count != reverseTextField.text?.count {
            resultLabel.text = sampletext.reverseString(textToReverse: reverseTextField.text ?? "")
            reverseButton.setTitle("Clear", for: .normal)
        }
    }
}


        



    
        
    
    


