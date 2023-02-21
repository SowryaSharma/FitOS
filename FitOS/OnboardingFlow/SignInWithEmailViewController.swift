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
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var SignInButton: GradientButton!
    @IBOutlet weak var HeaderImageview: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        EmailTextField.delegate = self
        PasswordTextfield.delegate = self
        EmailTextField.tag = 1
        PasswordTextfield.tag = 2
        EmailTextField.returnKeyType = .next
        EmailTextField.keyboardType = .emailAddress
        EmailTextField.autocapitalizationType = .none
        EmailTextField.autocorrectionType = .no
        PasswordTextfield.returnKeyType = .done
        self.navigationController?.navigationBar.backItem?.title = "f"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardDidHideNotification, object: nil)
        let vc = UIHostingController(rootView: exampleSwiftui())
        let swiftuiView = vc.view!
        view.addSubview(swiftuiView)
        let gradient = CAGradientLayer()
        var bounds = SignInButton.bounds
        self.hideKeyboardWhenTappedAround()
    }
    // Implement UITextFieldDelegate method to move to the next text field
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let nextTextField = view.viewWithTag(textField.tag + 1) as? UITextField {
                nextTextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
                
            }
            return true
        }
  
    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 48, right: 0.0)
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//        var rect = textField.frame
//        rect.size.height += 10
//        scrollView.scrollRectToVisible(rect, animated: true)
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//    }


    @objc private func keyboardWillShow(notification: NSNotification){
        if(!isKeyboardPresent){
            isKeyboardPresent = true
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.scrollView.frame.origin.y -= 0
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        isKeyboardPresent = false
        self.scrollView.frame.origin.y = 0
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
                        if( !Auth.auth().currentUser!.isEmailVerified) {
                           print("email not verified")
//                            self.sendVerificationMail()
                          }
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

                                    self.PushToHome()
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
                                UiUtils.showToast(message: "\(statuscode)")
                            }
                            }
                            else{
                                print("failre")
                            }
                        }
                    }
                    print(AuthResult.user.getIDToken())
                }
            }
        }
        else{
            print("Sign uping with email")
                guard let email = self.EmailTextField.text else{return}
                guard let password = self.PasswordTextfield.text else{return}

            AuthenticationHandler.Shared.SignUpWithEmail(with: email, password: password, controller: self) { authresults in
                print(authresults?.user.email)
                if(authresults?.user.uid != nil){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else{
                    UiUtils.showToast(message: "Failed signing up with email")
                }
            }
        }
//        if( !Auth.auth().currentUser!.isEmailVerified) {
//         print("Not verified email")
//        }
    }
    public func sendVerificationMail() {
        var authUser = Auth.auth().currentUser
      if authUser != nil && !authUser!.isEmailVerified {
        authUser!.sendEmailVerification(completion: { (error) in
//            UiUtils.showToast(message: "Check Email for verification")
        })
      } else {
        return
      }
    }
    func PushToHome(){
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
