//
//  Presentable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension Presentable where Self: UIViewController {
    func toPresent() -> UIViewController {
        return self
    }
}
