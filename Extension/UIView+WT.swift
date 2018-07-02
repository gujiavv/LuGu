//
//  UIView+WT.swift
//  demo0409
//
//  Created by 111 on 2018/4/13.
//  Copyright © 2018年 mars. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    @IBInspectable var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var boardWidth:CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var boardColor:UIColor? {
        get {
            return UIColor(cgColor:layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
