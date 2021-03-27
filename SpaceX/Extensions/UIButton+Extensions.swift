//
//   UIButton+Extensions.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
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
