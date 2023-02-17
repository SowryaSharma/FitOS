//
//  Createprofile2ViewController.swift
//  FitOS
//
//  Created by cumulations on 10/02/23.
//

import UIKit

class Createprofile2ViewController: UIViewController, UITextFieldDelegate {
    var isKeyboardPresent = false
    @IBOutlet weak var usernameTextfield: PaddedTextField!
    
    @IBOutlet weak var firstnametextfield: PaddedTextField!
    @IBOutlet weak var lastnametextfield: PaddedTextField!
    @IBOutlet weak var continueBtn: GradientButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardDidHideNotification, object: nil)
        // Do any additional setup after loading the view.
        usernameTextfield.delegate = self
        usernameTextfield.tag = 0
        
        firstnametextfield.delegate = self
        firstnametextfield.tag = 1
        
        lastnametextfield.delegate = self
        lastnametextfield.tag = 2
        
        continueBtn.isEnabled = false
        continueBtn.backgroundColor = .gray
    }
    
    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func ActionButtonContinue(_ sender: Any) {
        if(usernameTextfield.text != nil){
        let vc = storyboard?.instantiateViewController(withIdentifier: "canWeContactViewController") as! canWeContactViewController
        navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc private func keyboardWillShow(notification: NSNotification){
        if(!isKeyboardPresent){
        isKeyboardPresent = true
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification){
        isKeyboardPresent = false
        self.view.frame.origin.y = 0
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Determine the new text after the user types a new character
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }
        
        let newText = oldText.replacingCharacters(in: r, with: string)
        print("newText: \(newText)")
        
        // Set the text field's text to the new text
        textField.text = newText
        print("textField.text: \(textField.text)")
        
        // Enable or disable the continue button based on whether all three text fields have text
        if let text1 = firstnametextfield.text, !text1.isEmpty,
           let text2 = lastnametextfield.text, !text2.isEmpty,
           let text3 = usernameTextfield.text, !text3.isEmpty {
            continueBtn.isEnabled = true
//            continueBtn.backgroundColor = continueBtn.backgroundColor(for: .normal)
        } else {
            continueBtn.isEnabled = false
            continueBtn.backgroundColor = .gray
        }
        
        return false
    }


   

}
