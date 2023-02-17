//
//  FeaturedChallengeCollectionViewCell.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class FeaturedChallengeCollectionViewCell: UICollectionViewCell {
static var identifier = "FeaturedChallengeCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib() -> UINib{
        return UINib(nibName: "FeaturedChallengeCollectionViewCell", bundle: nil)
    }
    public func configure(with image:UIImage){
    }
}
