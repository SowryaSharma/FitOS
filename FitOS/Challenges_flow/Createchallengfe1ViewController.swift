//
//  Createchallengfe1ViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class Createchallengfe1ViewController: UIViewController {

    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var ButtonCreate: GradientButton!
    @IBOutlet weak var LeaderBoardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonCreate.layer.cornerRadius = 10
        LeaderBoardView.layer.cornerRadius = 1
    }
    
    @IBAction func actionButtonCreate(_ sender: Any) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "challenge2ViewController") as! challenge2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
