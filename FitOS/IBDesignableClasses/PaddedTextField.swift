//
//  PaddedTextField.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 16/02/23.
//

import UIKit

@IBDesignable class PaddedTextField: UITextField {
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
        return bounds.inset(by: padding)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + leftPadding + rightPadding
        let height = size.height
        return CGSize(width: width, height: height)
    }
}
