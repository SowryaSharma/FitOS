//
//  Createchallengfe1ViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class Createchallengfe1ViewController: UIViewController {

    @IBOutlet weak var ButtonCreate: GradientButton!
    @IBOutlet weak var LeaderBoardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonCreate.layer.cornerRadius = 10
        LeaderBoardView.layer.cornerRadius = 10
        self.navigationController?.isNavigationBarHidden = true
    }
    

    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
