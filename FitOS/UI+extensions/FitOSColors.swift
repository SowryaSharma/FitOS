//
//  FitOSColors.swift
//  FitOS
//
//  Created by Cumulations Technologies Private Limited on 20/02/23.
//

import UIKit

enum AppColors{
    case pink
}

extension UIColor{
    
    static func appColors(colorName: AppColors)->UIColor?{
        switch colorName{
        case .pink:
            return UIColor(named: "FitOSLightPink")
        }
    }
    
}
