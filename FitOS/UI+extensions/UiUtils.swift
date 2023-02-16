//
//  UiUtils.swift
//  FitOS
//
//  Created by cumulations on 16/02/23.
//

import Foundation
import UIKit
import Toast_Swift

class UiUtils{
    static func showToast(message: String) {
        if let window = UIApplication.shared.windows.last ?? UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first{
            window.makeToast(message, position: .bottom)
        }
    }
}
