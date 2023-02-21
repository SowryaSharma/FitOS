//
//  HomeProfileViewController.swift
//  FitOS
//
//  Created by cumulations on 20/02/23.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class HomeProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let LogOutButton = GradientButton()
        LogOutButton.setTitle("Logout", for: .normal)
        LogOutButton.setTitleColor(.white, for: .normal)
        LogOutButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        LogOutButton.layer.cornerRadius = 5
        LogOutButton.center = view.center
        LogOutButton.clipsToBounds = true
        LogOutButton.addTarget(self, action: #selector(Logout), for: .touchUpInside)
        view.addSubview(LogOutButton)
    }
    @objc func Logout(){
        logoutTheUser()
        Auth.auth().addStateDidChangeListener { auth, user in
                if let user = user {
                    // User is signed in.
                 } else {
                     guard let navigationController = self.navigationController else {return}
                     var count = navigationController.viewControllers.count-1
                     var navigationarray = navigationController.viewControllers
                     if(count >= 0){
                         navigationarray.remove(at: count)
                         count = navigationController.viewControllers.count
                     }
                     navigationController.viewControllers = navigationarray
                     navigationController.popViewController(animated: false)
                }
          }
    }
   
    func logoutTheUser() {
        print(Auth.auth().currentUser)
        print(GIDSignIn.sharedInstance.currentUser)
        GIDSignIn.sharedInstance.signOut()
        try! Auth.auth().signOut()
    }
}
