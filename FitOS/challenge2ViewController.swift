//
//  challenge2ViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class challenge2ViewController: UIViewController {

    @IBOutlet weak var BottomDescriptionabel: UILabel!
    @IBOutlet weak var peletonButton: UIButton!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var activeMinutesButton: UIButton!
    @IBOutlet weak var distanceBot: UIButton!
    @IBOutlet weak var stepsButton: UIButton!
    @IBOutlet weak var LineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LineView.layer.borderWidth = 1
        LineView.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionContinue(_ sender: Any) {
//        challengedateDurationViewController
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "challengedateDurationViewController") as! challengedateDurationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
