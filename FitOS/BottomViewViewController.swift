//
//  BottomViewViewController.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 17/02/23.
//

import UIKit

protocol BottomViewGenderDelegate: AnyObject {
    func didSelectGender(_ gender: String)
}
protocol BottomViewAgeDelegate: AnyObject {
    func didSelectAge(_ age: String)
}

class BottomViewViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    var selectedRowIndex: IndexPath?
    @IBOutlet weak var bottomTV: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bgButton: UIButton!
    var mainArray = [String]()
    let ageData = ["Below 18", "18-24","25-34","35-44","45-54","55-64","above 64"]
    let genderData = ["Male","Female","Others","Prefer not to say"]
    var selectedString = String()
    var titleText = String()
    
    weak var bottomViewGenderDelegate: BottomViewGenderDelegate?
    weak var bottomViewAgeDelegate: BottomViewAgeDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 18.0
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.layer.masksToBounds = true
        
        if(titleText=="Select Your Age Range"){
            headerLabel.text = "Select Your Age Range"
            mainArray = ["Below 18", "18-24","25-34","35-44","45-54","55-64","above 64"]
        }else if(titleText=="Select Your Gender"){
            headerLabel.text = "Select Your Gender"
            mainArray = ["Male","Female","Others","Prefer not to say"]
        }
    }
    
    @IBAction func bgButtonTap(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelBtnTap(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func continueBtnTap(_ sender: GradientButton) {
        if(selectedString != ""){
            if(titleText=="Select Your Age Range"){
                bottomViewAgeDelegate?.didSelectAge(selectedString)
            }else if(titleText=="Select Your Gender"){
                bottomViewGenderDelegate?.didSelectGender(selectedString)
            }
            self.dismiss(animated: false, completion: nil)
        }else{
            //MARK: - TO DO show some toast msg to select one option
        }
       
    }
}
extension BottomViewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomViewTVCell", for: indexPath) as! BottomViewTVCell
        let data = mainArray[indexPath.row]
        cell.selectionStyle = .none
        cell.myLabel.text = data
        cell.myLabel.layer.cornerRadius = 5
        cell.myLabel.layer.masksToBounds = true
        cell.myLabel.textColor = UIColor.gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        58
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BottomViewTVCell
        
        // Change the background color of the newly selected button
        cell.myLabel.backgroundColor = UIColor(named: "FitOSPink")
        cell.myLabel.textColor = UIColor.black
        self.selectedString = mainArray[indexPath.row]
        // Revert the background color of the previously selected button, if any
        if let previousSelectedIndex = selectedRowIndex {
            let previousSelectedCell = tableView.cellForRow(at: previousSelectedIndex) as! BottomViewTVCell
            previousSelectedCell.myLabel.backgroundColor = UIColor.white
        }
        
        // Update the selected row index variable
        selectedRowIndex = indexPath
    }
    
}

class BottomViewTVCell: UITableViewCell {
   
    @IBOutlet weak var myLabel: UILabel!
}

