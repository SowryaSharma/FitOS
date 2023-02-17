//
//  GradientColorButton.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 16/02/23.
//

import Foundation
import UIKit

@IBDesignable class GradientButton: UIButton {
    @IBInspectable var startColor: UIColor = UIColor(red: 0.404, green: 0.027, blue: 0.878, alpha: 1)
    @IBInspectable var endColor: UIColor = UIColor(red: 1, green: 0.38, blue: 0.863, alpha: 1)
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        
        layer.insertSublayer(gradient, at: 0)
    }
}

extension NSAttributedString.Key {
    static let backgroundGradient = NSAttributedString.Key(rawValue: "backgroundGradient")
}

@IBDesignable class GradientTextButton: UIButton {
    
    @IBInspectable var startColor: UIColor = UIColor(red: 0.404, green: 0.027, blue: 0.878, alpha: 1)
    @IBInspectable var endColor: UIColor = UIColor(red: 1, green: 0.38, blue: 0.863, alpha: 1)

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        
        layer.insertSublayer(gradient, at: 0)
        setTitleColor(.clear, for: .normal)
        setTitleColor(.clear, for: .highlighted)
        
        if let titleLabel = titleLabel {
            let attributedText = NSAttributedString(string: titleLabel.text ?? "", attributes: [.foregroundColor: UIColor.clear, .backgroundGradient: gradient])
            titleLabel.attributedText = attributedText
        }
        
        backgroundColor = UIColor.clear
    }
}
