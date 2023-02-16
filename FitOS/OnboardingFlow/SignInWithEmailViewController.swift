//
//  SignInWithEmailViewController.swift
//  FitOS
//
//  Created by cumulations on 07/02/23.
//

import UIKit
import SwiftUI
import FirebaseAuth
import GoogleSignIn
class SignInWithEmailViewController: UIViewController,UITextFieldDelegate {
    var isKeyboardPresent = false
    var sign_in = true
    var email:String?
    var password:String?
    @IBOutlet weak var Signin_upLabel: UILabel!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var HeaderImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTextField.delegate = self
        PasswordTextfield.delegate = self
        self.navigationController?.navigationBar.backItem?.title = "f"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardDidHideNotification, object: nil)
        let vc = UIHostingController(rootView: exampleSwiftui())
        let swiftuiView = vc.view!
        view.addSubview(swiftuiView)
        AuthenticationHandler.Shared.SignUpWithEmail(with: "sowryasharma@gmail.com", password: "password", controller: self) { results in
            print(results)
        }
        let gradient = CAGradientLayer()
        var bounds = SignInButton.bounds
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
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
    @IBAction func ActionButtonSignIN(_ sender: Any) {
        if(sign_in){
            guard let email = EmailTextField.text else{return}
            guard let password = PasswordTextfield.text else{return}
            AuthenticationHandler.Shared.SigninWithEmail(with: email, password: password, controller: self) { AuthResult, error in
                if let error = error{
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                    UiUtils.showToast(message: error.localizedDescription)
                    }
                }
                if let AuthResult = AuthResult {
                    AuthResult.user.getIDToken { token, error in
                        print(token ?? error)
                        guard let token = token else{
                            DispatchQueue.main.async {
                            UiUtils.showToast(message: "Failed getting access token")
                            }
                            return
                        }
//                        networkService.shared.Post(withEndppoint: constants.SigniNEndpoints, tokenString: token!, param: nil) { status, statuscode in
                        networkService.shared.SignIn(withToken: token) { status,statuscode in
                            if(status){
                            if(statuscode == 200){
                                DispatchQueue.main.async {
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                            else if(statuscode == 201){
                                DispatchQueue.main.async {
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                                self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                            else{
                                print(statuscode)
                            }
                            }
                            else{
                                print("failre")
                            }
                        }
                    }
                    print(GIDSignIn.sharedInstance.currentUser?.accessToken)
                    print(AuthResult.user.getIDToken())
                }
            }
        }
        else{
            DispatchQueue.main.sync {
            guard let email = EmailTextField.text else{return}
            guard let password = PasswordTextfield.text else{return}
            }
            guard let email = email else {
                return
            }
            guard let password = password else {
                return
            }

            AuthenticationHandler.Shared.SignUpWithEmail(with: email, password: password, controller: self) { authresults in
                print(authresults?.user.email)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    @IBAction func actionButtonSignup(_ sender: Any) {
        if(sign_in){
            Signin_upLabel.text = "Sign-Up with Email"
            SignInButton.setTitle("Sign-Up", for: .normal)
            SignUpButton.setTitle("Have an account already? Sign-in", for: .normal)
            sign_in = false
        }
        else{
            Signin_upLabel.text = "Sign-in with Email"
            SignInButton.setTitle("Sign-in", for: .normal)
            SignUpButton.setTitle("Don't Have an account? Sign-up", for: .normal)
            sign_in = true
        }
    }
    func setUpUI(){
        guard let headerimage = UIImage(named: constants.SigninWithEmailImageFrame) else {
            return
        }
        HeaderImageview.image = headerimage
        SignInButton.applyGradient(colours: [constants.buttonGradientColor1,constants.buttonGradientColor2], locations: [0.0, 0.5, 1.0])
    }
    func setupConstraints(){
    }
}
