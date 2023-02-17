//
//  ToolTipView.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 17/02/23.
//

import UIKit

class ToolTipView: UIView {
    private let text: String
    private let width: CGFloat
    private let height: CGFloat
    
    init(text: String, width: CGFloat, height: CGFloat) {
        self.text = text
        self.width = width
        self.height = height
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        // Draw background
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: width, height: height))
        
        // Draw text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                          NSAttributedString.Key.paragraphStyle: paragraphStyle,
                          NSAttributedString.Key.foregroundColor: UIColor.black]
        let textRect = CGRect(x: 0, y: 0, width: width, height: height)
        text.draw(in: textRect, withAttributes: attributes)
    }
    
    
    
    func dismiss() {
        removeFromSuperview()
    }
    func show(from button: UIButton) {
        let origin = CGPoint(x: button.frame.maxX + 10, y: button.frame.midY - height/2)
        let frame = CGRect(origin: origin, size: CGSize(width: width, height: height))
        self.frame = frame
        button.superview?.addSubview(self)

            // Add a tap gesture recognizer to the superview
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            superview?.addGestureRecognizer(tapGestureRecognizer)
        
        // Set the z-position of the ToolTipView to ensure it appears on top of other views
        layer.zPosition = 1

        // Add the ToolTipView as the last subview of the superview
        superview?.addSubview(self)

        }

        @objc private func handleTap(_ sender: UITapGestureRecognizer) {
            // Dismiss the view when the user taps outside it
            dismiss()
        }
}
