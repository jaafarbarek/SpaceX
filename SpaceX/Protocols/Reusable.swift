//
//  Reusable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
