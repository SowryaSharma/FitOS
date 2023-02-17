//
//  DashboardVC.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 17/02/23.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtnTap(_ sender: GradientButton) {
        
        GIDSignIn.sharedInstance.signOut()
        
        let ChallengesStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
