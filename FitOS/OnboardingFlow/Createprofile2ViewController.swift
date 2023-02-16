//
//  Createprofile2ViewController.swift
//  FitOS
//
//  Created by cumulations on 10/02/23.
//

import UIKit

class Createprofile2ViewController: UIViewController {
    var isKeyboardPresent = false
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var lastnametextfield: UITextField!
    @IBOutlet weak var firstnametextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardDidHideNotification, object: nil)
        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
