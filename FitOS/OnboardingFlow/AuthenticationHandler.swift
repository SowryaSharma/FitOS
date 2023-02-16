//
//  AuthenticationHandler.swift
//  FitOS
//
//  Created by cumulations on 09/02/23.
//

import Foundation
import GoogleSignIn
import UIKit
import FirebaseAuth
class AuthenticationHandler{
    static var Shared = AuthenticationHandler()
    func SignInWithGoogle(Controller:UIViewController, completionHandler: @escaping (String?,Bool)-> Void){
        GIDSignIn.sharedInstance.signIn(withPresenting: Controller){signinResults,error in
            if let error = error{
                print(error)
                completionHandler(error.localizedDescription,false)
                return
            }
            completionHandler(signinResults?.user.idToken?.tokenString,true)
        }
    }
    func SigninWithEmail(with email:String,password:String,controller:UIViewController,completionHanlder: @escaping (AuthDataResult?,Error?)->Void){
        Auth.auth().signIn(withEmail: email, password: password) { authdata, error in
                completionHanlder(authdata,error)
        }
    }
    func SignUpWithEmail(with email:String,password:String,controller:UIViewController,completionHanlder: @escaping (AuthDataResult?)->Void){
        Auth.auth().createUser(withEmail: email, password: password) { AUTHDATA, ERROR in
            if let ERROR = ERROR{
                print(ERROR.localizedDescription)
                return
            }
            completionHanlder(AUTHDATA)
        }
    }
    func SignInWithApple(){
    }
}
