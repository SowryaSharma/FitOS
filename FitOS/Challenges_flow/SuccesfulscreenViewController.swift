//
//  SuccesfulscreenViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class SuccesfulscreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func homeBtnAction(_ sender: GradientButton) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
