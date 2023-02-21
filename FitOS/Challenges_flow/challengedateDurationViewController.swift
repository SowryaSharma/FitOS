//
//  challengedateDurationViewController.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit
import DropDown

class challengedateDurationViewController: UIViewController {

    let dropDown = DropDown()
    
    @IBOutlet weak var challengeTF: UITextField!
    @IBOutlet weak var selectDateBtn: UIButton!
    @IBOutlet weak var challengeDropDown: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        challengeDropDown.setTitleColor(.black, for: .normal)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func challengeDropDownTap(_ sender: UIButton) {
        dropDown.dataSource  = (1...31).map { String($0) }
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            self?.challengeDropDown.setTitle(item as String, for: UIControl.State.normal)
            self?.challengeDropDown.setTitleColor(.black, for: .normal)
        }

    }
    var picker : UIDatePicker = UIDatePicker()
    let pickerDateView = UIView()
    let hiddenBtn = UIButton()
    @IBAction func selectDateBtnTap(_ sender: UIButton) {
        
        pickerDateView.removeFromSuperview()
        hiddenBtn.removeFromSuperview()
        picker.removeFromSuperview()
        
        hiddenBtn.frame = CGRect (x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        hiddenBtn.backgroundColor = UIColor.black
        hiddenBtn.alpha = 0.5
        self.view.addSubview(hiddenBtn)
        
        pickerDateView.frame = CGRect(x: 0, y: self.view.frame.size.height - 300, width: self.view.frame.size.width, height: 300)
        pickerDateView.backgroundColor = UIColor.white
        self.view.addSubview(pickerDateView)
        
        let doneBtn = UIButton()
        doneBtn.frame = CGRect(x: pickerDateView.frame.size.width - 100, y: 10, width: 80, height: 30)
        doneBtn.setTitle("Done", for: UIControl.State.normal)
        doneBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        doneBtn.titleLabel?.font = UIFont.init(name: kAppFontMedium, size: 13)
        doneBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        doneBtn.addTarget(self, action: #selector(doneBtnTap), for: .touchUpInside)
        pickerDateView.addSubview(doneBtn)
        
        //Seperator Line 1 Lbl
        
        let seperatorLine1 = UILabel()
        seperatorLine1.frame = CGRect(x: 0, y: doneBtn.frame.size.height+doneBtn.frame.origin.y, width: pickerDateView.frame.size.width , height: 1)
        seperatorLine1.backgroundColor = UIColor.yellow
        pickerDateView.addSubview(seperatorLine1)
        
        picker = UIDatePicker()
        picker.datePickerMode = UIDatePicker.Mode.date
        
        picker.addTarget(self, action: #selector(dueDateChanged(sender:)), for: UIControl.Event.valueChanged)
        picker.frame = CGRect(x:0.0, y:50, width: pickerDateView.frame.size.width, height:300)
        picker.tintColor = UIColor.red
        picker.backgroundColor = UIColor.yellow
        // you probably don't want to set background color as black
//         picker.backgroundColor = UIColor.black
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        
        pickerDateView.addSubview(picker)
        
       
        let currentDate = Date()
        let eventDatePicker = UIDatePicker()
        
        eventDatePicker.datePickerMode = UIDatePicker.Mode.date
        eventDatePicker.minimumDate = currentDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
 
    }
    @objc func dueDateChanged(sender:UIDatePicker){
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let selectedDate = dateFormatter.string(from: picker.date)
   
        selectDateBtn.setTitle(selectedDate, for: .normal)
        selectDateBtn.setTitleColor(.black, for: .normal)
        
    }
    @objc func doneBtnTap(_ sender: UIButton) {
        
        hiddenBtn.removeFromSuperview()
        pickerDateView.removeFromSuperview()
        
    }
    @IBAction func actionContinue(_ sender: Any) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "createchallenge3ViewController") as! createchallenge3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    

}
