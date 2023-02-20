//
//  JoinOrCreateChallengeViewController.swift
//  FitOS
//
//  Created by cumulations on 16/02/23.
//

import UIKit

class JoinOrCreateChallengeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreChallemngesTableViewCell.identifier) as! MoreChallemngesTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    @IBOutlet weak var ChallengesTableView: UITableView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedChallengeCollectionViewCell.identifier, for: indexPath) as! FeaturedChallengeCollectionViewCell
        return cell
    }
    

    @IBOutlet weak var FeaturedChallengesCoollectionView: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    @IBAction func actionButtonCreateButton(_ sender: Any) {
        let ChallengesStoryboard = UIStoryboard(name: "ChallengesStoryboard", bundle: nil)
        let vc = ChallengesStoryboard.instantiateViewController(withIdentifier: "Createchallengfe1ViewController") as! Createchallengfe1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
//        Createchallengfe1ViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChallengesTableView.register(MoreChallemngesTableViewCell.nib(), forCellReuseIdentifier: MoreChallemngesTableViewCell.identifier)
        ChallengesTableView.delegate=self
        ChallengesTableView.dataSource=self
        FeaturedChallengesCoollectionView.delegate = self
        FeaturedChallengesCoollectionView.dataSource = self
        FeaturedChallengesCoollectionView.register(FeaturedChallengeCollectionViewCell.nib(), forCellWithReuseIdentifier: FeaturedChallengeCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing =  10
        layout.itemSize = CGSize(width: 300, height: 120)
        FeaturedChallengesCoollectionView.collectionViewLayout = layout
        createButton.layer.cornerRadius = 10


        // Do any additional setup after loading the view.
    }

}
