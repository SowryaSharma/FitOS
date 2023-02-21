//
//  GradientColorLabel.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 20/02/23.
//

import UIKit


class GradientLabel: UILabel {
    
    let gradientImage = UIImage(named:"gradient.png")
    
    override func layoutSubviews() {
        
        guard let grad = gradientImage else { // skip re-drawing gradient if it doesn't exist
            return
        }
        
        // redraw your gradient image
        UIGraphicsBeginImageContext(frame.size)
        grad.draw(in: bounds)
        let myGradient = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // update text color
        textColor = UIColor(patternImage: myGradient!)
    }
    
   override func draw(_ rect: CGRect) {
        // begin new image context to let the superclass draw the text in (so we can use it as a mask)
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        do {
            // get your image context
            let ctx = UIGraphicsGetCurrentContext()

            // flip context
            ctx!.scaleBy(x: 1, y: -1)
            ctx!.translateBy(x: 0, y: -bounds.size.height)

            // get the superclass to draw text
            super.draw(rect)
        }

        // get image and end context
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // get drawRect context
        let ctx = UIGraphicsGetCurrentContext()

        // clip context to image
        ctx!.clip(to: bounds, mask: (img?.cgImage!)!)

        // define your colors and locations
        let colors = [ UIColor(red: 0.404, green: 0.027, blue: 0.878, alpha: 1).cgColor,
                       UIColor(red: 1, green: 0.38, blue: 0.863, alpha: 1).cgColor]
       let locs:[CGFloat] = [0.0, 1.0]

        // create your gradient
       guard let grad = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: locs) else { return }

        // draw gradient diagonally
       let startPoint = CGPoint(x: 0.25, y: 0.5)
       let endPoint = CGPoint(x: 0.75, y: 0.5)
        ctx?.drawRadialGradient(grad, startCenter: startPoint, startRadius: 0, endCenter: endPoint, endRadius: sqrt(pow(bounds.width, 2) + pow(bounds.height, 2)), options: CGGradientDrawingOptions(rawValue: 0))
    }


}
