//
//  ChallengesViewController.swift
//  FitOS
//
//  Created by cumulations on 16/02/23.
//

import UIKit

class ChallengesViewController: UIViewController {
    @IBOutlet weak var navigationButtonChat: UIButton!
    @IBOutlet weak var navigationButtonHelp: UIButton!
    
    @IBOutlet weak var joinAndCreateButton: GradientButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationButtonChat.setTitle("", for: .normal)
        navigationButtonHelp.setTitle("", for: .normal)
        joinAndCreateButton.layer.borderWidth = 5
        joinAndCreateButton.titleLabel?.adjustsFontSizeToFitWidth = true
        joinAndCreateButton.layer.borderColor = UIColor.clear.cgColor
        // Do any additional setup after loading the view.
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
