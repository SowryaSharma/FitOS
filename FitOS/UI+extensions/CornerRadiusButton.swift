//
//  CornerRadiusButton.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 20/02/23.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8 // Or set to a specific value
        clipsToBounds = true
    }
}

