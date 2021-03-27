//
//  UITextfield+Extensions.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit

extension UITextField {
    func applyStyle(textColor: UIColor?, font: UIFont? = nil) {
        self.textColor = textColor
        self.font = font ?? self.font
    }
}
