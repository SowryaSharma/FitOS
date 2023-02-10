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

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var HeaderImageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIHostingController(rootView: exampleSwiftui())
         let swiftuiView = vc.view!
        view.addSubview(swiftuiView)
        AuthenticationHandler.Shared.SignUpWithEmail(with: "sowryasharma@gmail.com", password: "password", controller: self) { results in
            print(results)
        }
    }
    @IBAction func ActionButtonSignIN(_ sender: Any) {
        guard let email = EmailTextField.text else{return}
        guard let password = PasswordTextfield.text else{return}
        AuthenticationHandler.Shared.SigninWithEmail(with: email, password: password, controller: self) { AuthResult, error in
            if let error = error{
                print(error.localizedDescription)
            }
            if let AuthResult = AuthResult {
                AuthResult.user.getIDToken { token, error in
                    print(token ?? error)
                }
                print(GIDSignIn.sharedInstance.currentUser?.accessToken)
                print(AuthResult.user.getIDToken())
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Homeviewcontroller")
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    @IBAction func actionButtonSignup(_ sender: Any) {
        guard let email = EmailTextField.text else{return}
        guard let password = PasswordTextfield.text else{return}
        AuthenticationHandler.Shared.SignUpWithEmail(with: email, password: password, controller: self) { authresults in
            print(authresults?.user.email)
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
