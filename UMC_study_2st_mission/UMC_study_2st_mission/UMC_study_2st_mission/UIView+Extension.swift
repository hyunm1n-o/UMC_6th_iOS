//
//  UIView+Extension.swift
//  UMC_study_2st_mission
//
//  Created by 오현민 on 5/7/24.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
