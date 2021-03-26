//
//  UILabel+Extensions.swift
//  Matic
//
//  Created by Konrad Kierys on 29/03/2019.
//  Copyright © 2019 Software Brothers. All rights reserved.
//

import UIKit

extension UILabel {
    func applyStyle(textColor: UIColor?, font: UIFont? = nil) {
        self.textColor = textColor
        self.font = font ?? self.font
    }
}
