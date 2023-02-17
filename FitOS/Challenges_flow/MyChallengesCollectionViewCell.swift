//
//  MyChallengesCollectionViewCell.swift
//  FitOS
//
//  Created by cumulations on 16/02/23.
//

import UIKit

class MyChallengesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ChallengeparticipantsLabel: UILabel!
    @IBOutlet weak var ChallengeDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ChallengeNameLabel: UILabel!
    @IBOutlet weak var challengeparticipantsImages: UIImageView!
    static var identifier = "MyChallengesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func configure(with image:UIImage){
        imageView.image = image
        challengeparticipantsImages.image = image
        ChallengeparticipantsLabel.text = "100 participamnts"
        ChallengeDateLabel.text = "Jan 1-31"
        ChallengeNameLabel.text = "January FitClub Challenge"
    }
    static func nib() -> UINib{
        return UINib(nibName: "MyChallengesCollectionViewCell", bundle: nil)
    }

}
