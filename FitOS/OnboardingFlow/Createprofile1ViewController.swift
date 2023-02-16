//
//  Createprofile1ViewController.swift
//  FitOS
//
//  Created by cumulations on 10/02/23.
//

import UIKit

class Createprofile1ViewController: UIViewController {
    var AgeData: [String] = [String]()
    var genderData:[String] = [String]()
    
    @IBOutlet weak var AgeView: UIView!
    var email:String = ""
    
    @IBOutlet weak var ageDropDown: UIButton!
    
    @IBOutlet weak var genderDropDown: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        AgeView.layer.borderWidth = 2
        AgeView.layer.borderColor = UIColor.black.cgColor
//        AgeData = ["Below 18", "18-24","25-34","35-44","45-54","55-64","above 64"]
//        genderData = ["Male","Female","Others","Prefer not to say"]
        // Do any additional setup after loading the view.
    }
    
    public func Init(email:String){
        self.email = email
    }

    @IBAction func ageButtonBtnTap(_ sender: UIButton) {
    }
    @IBAction func genderButtonTap(_ sender: UIButton) {
    }
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func queriesBtnTap(_ sender: UIButton) {
    }
    @IBAction func ActionButtonContinue(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Createprofile2ViewController") as! Createprofile2ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipBtnTap(_ sender: UIButton) {
    }
    
}
