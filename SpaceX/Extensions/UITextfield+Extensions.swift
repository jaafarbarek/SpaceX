//
//  UITextfield+Extensions.swift
//  Matic
//
//  Created by MATIC on 7/17/19.
//  Copyright © 2019 Software Brothers. All rights reserved.
//

import UIKit

extension UITextField {
    func applyStyle(textColor: UIColor?, font: UIFont? = nil) {
        self.textColor = textColor
        self.font = font ?? self.font
    }
}
