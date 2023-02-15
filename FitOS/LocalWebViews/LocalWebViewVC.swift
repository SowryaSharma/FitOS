//
//  LocalWebViewVC.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 15/02/23.
//

import UIKit
import WebKit

class LocalWebViewVC: UIViewController {

    var whatToShow = String()
    @IBOutlet weak var localWebView: WKWebView!
    
    @IBOutlet weak var headerLabel: UILabel!
    var headerLabelText = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        if(whatToShow=="termsAndConditions"){
            let url: URL! = URL(string: "https://www.healthline.com/nutrition/healthy-fruit")
            headerLabel.text = headerLabelText
            localWebView.load(URLRequest(url: url))
        }else if(whatToShow=="privacyPolicy"){
            let url: URL! = URL(string: "https://www.healthline.com/nutrition/healthy-fruit")
            headerLabel.text = headerLabelText
            localWebView.load(URLRequest(url: url))
        }
        
    }
    
    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
