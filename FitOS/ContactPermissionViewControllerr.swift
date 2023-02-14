
//
//  Created by cumulations on 21/12/23.
//

import UIKit
public class canWeContactViewController: UIViewController {
    @IBOutlet weak var CheckButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    var checked = false
    public override func viewDidLoad() {
        super.viewDidLoad()
        CheckButton.setTitle("", for: .normal)
    }

    @IBAction func actionButtonCheck(_ sender: Any) {
        print("sctioButtonCheck")
        if(checked){
            checked = false
            CheckButton.setImage(UIImage(named: "unselected"), for: .normal)
        }
        else{
            checked = true
            CheckButton.setImage(UIImage(named: "selected"), for: .normal)
            
        }
    }
    @IBAction func ActionButtonContinue(_ sender: Any) {
        if(checked){
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
