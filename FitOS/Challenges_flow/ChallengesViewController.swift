//
//  ChallengesViewController.swift
//  FitOS
//
//  Created by cumulations on 16/02/23.
//

import UIKit

class ChallengesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyChallengesCollectionViewCell.identifier, for: indexPath) as! MyChallengesCollectionViewCell
        cell.configure(with: UIImage(named: "Rectangle 1673")!)
        return cell
    }
    
    @IBOutlet weak var navigationButtonChat: UIButton!
    @IBOutlet weak var navigationButtonHelp: UIButton!
    @IBOutlet weak var MychallengesCollectionView: UICollectionView!
    
    @IBOutlet weak var MychallengesCollectionView2: UICollectionView!
    @IBOutlet weak var joinAndCreateButton: GradientButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        MychallengesCollectionView.delegate = self
        MychallengesCollectionView.dataSource = self
        MychallengesCollectionView.register(MyChallengesCollectionViewCell.nib(), forCellWithReuseIdentifier: MyChallengesCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing =  10
        layout.itemSize = CGSize(width: 300, height: 120)
        MychallengesCollectionView.collectionViewLayout = layout
        self.MychallengesCollectionView.isPagingEnabled = true;
        
        MychallengesCollectionView2.delegate = self
        MychallengesCollectionView2.dataSource = self
        MychallengesCollectionView2.register(MyChallengesCollectionViewCell.nib(), forCellWithReuseIdentifier: MyChallengesCollectionViewCell.identifier)
        MychallengesCollectionView2.collectionViewLayout = layout
        self.MychallengesCollectionView2.isPagingEnabled = true;
        navigationButtonChat.setTitle("", for: .normal)
        navigationButtonHelp.setTitle("", for: .normal)
        joinAndCreateButton.layer.cornerRadius = 10
        joinAndCreateButton.titleLabel?.adjustsFontSizeToFitWidth = true
        joinAndCreateButton.layer.borderColor = UIColor.clear.cgColor
    }

    @IBAction func actionButtonJoinAndCreate(_ sender: Any) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "JoinOrCreateChallengeViewController") as! JoinOrCreateChallengeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
