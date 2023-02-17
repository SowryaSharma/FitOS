//
//  MoreChallemngesTableViewCell.swift
//  FitOS
//
//  Created by cumulations on 17/02/23.
//

import UIKit

class MoreChallemngesTableViewCell: UITableViewCell {
    static var identifier = "MoreChallemngesTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib()->UINib{
        return UINib(nibName: "MoreChallemngesTableViewCell", bundle: nil)
    }
    
}
