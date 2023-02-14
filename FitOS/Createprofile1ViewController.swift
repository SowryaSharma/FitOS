//
//  Createprofile1ViewController.swift
//  FitOS
//
//  Created by cumulations on 10/02/23.
//

import UIKit

class Createprofile1ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var AgeData: [String] = [String]()
    var genderData:[String] = [String]()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 1){
        return AgeData.count
        }
        else{
            return genderData.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1){
        return AgeData[row]
        }
        else{
            return genderData[row]
        }
    }
    
    var email:String = ""
    @IBOutlet weak var GenderPickerView: UIPickerView!
    @IBOutlet weak var AgePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AgePickerView.delegate = self
        AgePickerView.dataSource = self
        GenderPickerView.delegate = self
        GenderPickerView.dataSource = self
        AgeData = ["Below 18", "18-24","25-34","35-44","45-54","55-64","above 64"]
        genderData = ["Male","Female","Others","Prefer not to say"]
        // Do any additional setup after loading the view.
    }
    
    public func Init(email:String){
        self.email = email
    }

    @IBAction func ActionButtonContinue(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Createprofile2ViewController") as! Createprofile2ViewController
        navigationController?.pushViewController(vc, animated: true)
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
