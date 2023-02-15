//
//  HomeViewController.swift
//  FitOS
//
//  Created by cumulations on 13/02/23.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class HomeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
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
            // Show the app's signed-out state.
              print("Not signed in")
          } else {
            // Show the app's signed-in state.
              print("signed in")
              print(user?.profile?.email)
              self.label.text = "Signed in As \(user?.profile?.email ?? "")"
          }
        }

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
