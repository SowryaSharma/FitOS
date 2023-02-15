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
class SignInWithEmailViewController: UIViewController {
    var isKeyboardPresent = false
    var sign_in = true
    @IBOutlet weak var Signin_upLabel: UILabel!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var HeaderImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
//        let layer0 = CAGradientLayer()
//        layer0.colors = [
//          UIColor(red: 0.404, green: 0.027, blue: 0.878, alpha: 1).cgColor,
//          UIColor(red: 1, green: 0.38, blue: 0.863, alpha: 1).cgColor
//        ]
//        layer0.locations = [0, 1]
//        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
//        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
//        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.98, b: 0.95, c: -0.95, d: 1.35, tx: 0.48, ty: -0.65))
//        layer0.bounds = SignInButton.bounds.insetBy(dx: -0.5*SignInButton.bounds.size.width, dy: -0.5*SignInButton.bounds.size.height)
//        layer0.position = SignInButton.center
//        SignInButton.layer.addSublayer(layer0)
//        SignInButton.layer.cornerRadius = 8
//        SignInButton.applyGradient(colours: [constants.buttonGradientColor1,constants.buttonGradientColor2], locations: [0.0, 0.5, 1.0])
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
                    let alert = UIAlertController(title: "Failure", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
                if let AuthResult = AuthResult {
                    AuthResult.user.getIDToken { token, error in
                        print(token ?? error)
                    }
                    print(GIDSignIn.sharedInstance.currentUser?.accessToken)
                    print(AuthResult.user.getIDToken())
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Createprofile1ViewController") as! Createprofile1ViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        else{
            guard let email = EmailTextField.text else{return}
            guard let password = PasswordTextfield.text else{return}
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
