//
//  LaunchSelectable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import Foundation

protocol LaunchSelectable: class, Selectable {
    func didSelect(item: Launch)
}

extension LaunchSelectable {
    func didSelect(item: Any) {
        if let item = item as? Launch {
            didSelect(item: item)
        }
    }
}
