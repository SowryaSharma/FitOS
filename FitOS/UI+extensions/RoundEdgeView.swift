//
//  RoundEdgeView.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 20/02/23.
//
import UIKit

@IBDesignable
class ShadowView: UIView {
    // add properties for shadow, corner radius, and offset here
    @IBInspectable var shadowOpacity: Float = 1.5
    @IBInspectable var shadowRadius: CGFloat = 1.0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1.5)
    @IBInspectable var cornerRadius: CGFloat = 8.0

    override func draw(_ rect: CGRect) {
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }

}
