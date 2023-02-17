//
//  Createprofile1ViewController.swift
//  FitOS
//
//  Created by cumulations on 10/02/23.
//

import UIKit

class Createprofile1ViewController: UIViewController, BottomViewGenderDelegate, BottomViewAgeDelegate {
    func didSelectGender(_ gender: String) {
        if(gender == ""){
            genderButton.setTitle("Select", for: .normal)
        }else{
            genderButton.setTitle(gender, for: .normal)
        }
    }
    
    func didSelectAge(_ age: String) {
        if(age == ""){
            ageButton.setTitle("Select", for: .normal)
        }else{
            ageButton.setTitle(age, for: .normal)
        }
    }
    
    var AgeData: [String] = [String]()
    var genderData:[String] = [String]()
    
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var ageButton: UIButton!
    @IBOutlet weak var AgeView: UIView!
    var email:String = ""
    
    @IBOutlet weak var ageDropDown: UIButton!
    
    @IBOutlet weak var genderDropDown: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       
//        AgeData = ["Below 18", "18-24","25-34","35-44","45-54","55-64","above 64"]
//        genderData = ["Male","Female","Others","Prefer not to say"]
        // Do any additional setup after loading the view.
    }
    
    public func Init(email:String){
        self.email = email
    }

    @IBAction func ageButtonBtnTap(_ sender: UIButton) {
        let bottomView = self.storyboard?.instantiateViewController(withIdentifier: "BottomViewViewController") as! BottomViewViewController
        bottomView.modalPresentationStyle = .overCurrentContext
        bottomView.titleText = "Select Your Age Range"
        bottomView.bottomViewAgeDelegate = self
        self.present(bottomView, animated: false, completion: nil)
    }
    @IBAction func genderButtonTap(_ sender: UIButton) {
        let bottomView = self.storyboard?.instantiateViewController(withIdentifier: "BottomViewViewController") as! BottomViewViewController
        bottomView.modalPresentationStyle = .overCurrentContext
        bottomView.titleText = "Select Your Gender"
        bottomView.bottomViewGenderDelegate = self
        self.present(bottomView, animated: false, completion: nil)
    }
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func queriesBtnTap(_ sender: UIButton) {
//        Tooltip.addTooltip(to: sender, with: "Understanding your age range and gender helps us recommend challenges and groups for you. FITOS might share this information with gyms you associate with in the app in order to better serve you.")
        let toolTipView = ToolTipView(text: "Understanding your age range and gender helps us recommend challenges and groups for you. FITOS might share this information with gyms you associate with in the app in order to better serve you.", width: 204, height: 120)
        toolTipView.show(from: sender)
    }
    @IBAction func ActionButtonContinue(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Createprofile2ViewController") as! Createprofile2ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipBtnTap(_ sender: UIButton) {
    }
    
}
