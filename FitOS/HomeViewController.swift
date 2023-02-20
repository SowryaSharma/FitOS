//
//  HomeViewController.swift
//  FitOS
//
//  Created by cumulations on 13/02/23.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class HomeViewController: UITabBarController {
var signedin = true
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    @IBAction func actionButtonLogout(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        navigationController?.navigationItem.titleView?.isHidden = true
        guard let navigationController = navigationController else {return}
        var count = navigationController.viewControllers.count-1
        var navigationarray = navigationController.viewControllers
        if(count >= 0){
            navigationarray.remove(at: count)
            count = navigationController.viewControllers.count
        }
        navigationController.viewControllers = navigationarray
        navigationController.popViewController(animated: false)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        navigationController.pushViewController(vc, animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
          if error != nil || user == nil {
              print("Not signed in")
              self.signedin = false
          } else {
            // Show the app's signed-in state.
              print("signed in")
              self.signedin = true
              print(user?.profile?.email)
          }
        }
        if(Auth.auth().currentUser != nil){
            print("signed in with email or appler")
            signedin = true
        }
        else{
            signedin = false
        }
        if(!signedin){
            navigationController?.popViewController(animated: false)
        }
    }

}
