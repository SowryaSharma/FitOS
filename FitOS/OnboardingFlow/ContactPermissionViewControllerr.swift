
//
//  Created by cumulations on 21/12/23.
//

import UIKit
public class canWeContactViewController: UIViewController {
    @IBOutlet weak var CheckButton: UIButton!
    @IBOutlet weak var continueButton: GradientButton!
    var checked = false
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        CheckButton.setTitle("", for: .normal)
        continueButton.isEnabled = false
    }

    @IBAction func backBtnTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func actionButtonCheck(_ sender: Any) {
        print("sctioButtonCheck")
        if(checked){
            checked = false
            CheckButton.setImage(UIImage(named: "unselected"), for: .normal)
            continueButton.isEnabled = false
        }
        else{
            checked = true
            CheckButton.setImage(UIImage(named: "selected"), for: .normal)
            continueButton.isEnabled = true
        }
    }
    @IBAction func ActionButtonContinue(_ sender: Any) {
        if(checked){
            let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
            let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
