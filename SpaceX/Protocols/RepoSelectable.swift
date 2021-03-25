//
//  RepoSelectable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import Foundation

protocol RepoSelectable : class, Selectable {
    func didSelect(item: GitRepository)
}

extension RepoSelectable {
    func didSelect(item: Any) {
        if let repo = item as? GitRepository {
            didSelect(item: repo)
        }
    }
}
