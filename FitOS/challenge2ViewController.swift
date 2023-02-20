//
//  challenge2ViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class challenge2ViewController: UIViewController {

    @IBOutlet weak var BottomDescriptionabel: UILabel!
  
    @IBOutlet weak var sleepButton: RoundedButton!
    @IBOutlet weak var workoutButton: RoundedButton!
    @IBOutlet weak var peletonButton: RoundedButton!
    @IBOutlet weak var stepsButton: RoundedButton!
    @IBOutlet weak var distanceBot: RoundedButton!
    @IBOutlet weak var LineView: UIView!
    @IBOutlet weak var activeMinutesButton: RoundedButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        LineView.layer.borderWidth = 1
        LineView.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
        initialBtnBackground()
    }
    
    @IBAction func actionContinue(_ sender: Any) {
//        challengedateDurationViewController
        self.navigationController?.isNavigationBarHidden = true
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "challengedateDurationViewController") as! challengedateDurationViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
    func initialBtnBackground(){
        stepsButton.backgroundColor = UIColor.purple
        stepsButton.setTitleColor(.white, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
    }
    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func stepsBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.purple
        stepsButton.setTitleColor(.white, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        activeMinutesButton.setTitleColor(.black, for: .normal)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.setTitleColor(.black, for: .normal)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.setTitleColor(.black, for: .normal)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func distanceBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.appColors(colorName: .pink)
        stepsButton.setTitleColor(.black, for: .normal)
        distanceBot.backgroundColor = UIColor.purple
        distanceBot.setTitleColor(.white, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        activeMinutesButton.setTitleColor(.black, for: .normal)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.setTitleColor(.black, for: .normal)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.setTitleColor(.black, for: .normal)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func activeMinutesBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.appColors(colorName: .pink)
        stepsButton.setTitleColor(.black, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.purple
        activeMinutesButton.setTitleColor(.white, for: .normal)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.setTitleColor(.black, for: .normal)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.setTitleColor(.black, for: .normal)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func sleepBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.appColors(colorName: .pink)
        stepsButton.setTitleColor(.black, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        activeMinutesButton.setTitleColor(.black, for: .normal)
        sleepButton.backgroundColor = UIColor.purple
        sleepButton.setTitleColor(.white, for: .normal)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.setTitleColor(.black, for: .normal)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func workOutBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.appColors(colorName: .pink)
        stepsButton.setTitleColor(.black, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        activeMinutesButton.setTitleColor(.black, for: .normal)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.setTitleColor(.black, for: .normal)
        workoutButton.backgroundColor = UIColor.purple
        workoutButton.setTitleColor(.white, for: .normal)
        peletonButton.backgroundColor = UIColor.appColors(colorName: .pink)
        peletonButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func peletonBtnTap(_ sender: UIButton) {
        stepsButton.backgroundColor = UIColor.appColors(colorName: .pink)
        stepsButton.setTitleColor(.black, for: .normal)
        distanceBot.backgroundColor = UIColor.appColors(colorName: .pink)
        distanceBot.setTitleColor(.black, for: .normal)
        activeMinutesButton.backgroundColor = UIColor.appColors(colorName: .pink)
        activeMinutesButton.setTitleColor(.black, for: .normal)
        sleepButton.backgroundColor = UIColor.appColors(colorName: .pink)
        sleepButton.setTitleColor(.black, for: .normal)
        workoutButton.backgroundColor = UIColor.appColors(colorName: .pink)
        workoutButton.setTitleColor(.black, for: .normal)
        peletonButton.backgroundColor = UIColor.purple
        peletonButton.setTitleColor(.white, for: .normal)
    }
}
