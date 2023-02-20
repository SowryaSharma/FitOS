//
//  createchallenge3ViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class createchallenge3ViewController: UIViewController {

    @IBOutlet weak var continuebutton: GradientButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionContinue(_ sender: Any) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "SuccesfulscreenViewController") as! SuccesfulscreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}
