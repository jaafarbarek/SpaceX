//
//  UIButton+Extensions.swift
//  Matic
//
//  Created by Konrad Kierys on 29/03/2019.
//  Copyright © 2019 Software Brothers. All rights reserved.
//

import UIKit

extension UIButton {
    func setTitle(_ title: String?) {
        self.setTitle(title, for: .normal)
    }

    func applyStyle(_ textColor: UIColor?, backgroundColor: UIColor? = nil, font: UIFont? = nil) {
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = font ?? self.titleLabel?.font
        self.backgroundColor = backgroundColor ?? self.backgroundColor
    }
}
