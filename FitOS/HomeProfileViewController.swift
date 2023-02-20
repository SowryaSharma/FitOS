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
        GIDSignIn.sharedInstance.signOut()
    }
    

   

}
