//
//  UITableView+Extensions.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit

// swiftlint:disable force_cast
extension UITableView {

    func register<Cell: UITableViewCell>(cell: Cell.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.id)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(cell: Cell.Type, indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: cell.id, for: indexPath) as! Cell
    }

    func dequeueReusableCell<Cell: UITableViewCell>(cell: Cell.Type) -> Cell {
        dequeueReusableCell(withIdentifier: cell.id) as! Cell
    }

    var isNearTheBottomEdge: Bool {
        let startLoadingOffset: CGFloat = 20.0
        return contentOffset.y + frame.size.height + startLoadingOffset > contentSize.height
    }
}

// MARK: - Private Computed Variables
private extension UITableViewCell {
    static var id: String {
        return String(describing: Self.self)
    }

    static var nibName: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
}
