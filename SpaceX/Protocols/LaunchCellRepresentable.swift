//
//  LaunchCellRepresentable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import RxSwift
import Kingfisher

protocol GitRepositoryPresentable {
    
    var repoNameLabel: UILabel! {set get}
    var repoDescriptionLabel: UILabel! {set get}
    var avatarImageView: UIImageView! {set get}
    var ownerNameLabel: UILabel! {set get}
    var starCountLabel: UILabel! {set get}
    var disposeBag : DisposeBag {set get}
}

extension GitRepositoryPresentable {
    func map(repo: GitRepository?) {
        guard let repo = repo else {
            return
        }
        
        repoNameLabel?.text = repo.repoName()
        repoDescriptionLabel?.text = repo.description
        avatarImageView?.kf.setImage(with: URL(string: repo.owner.avatarUrl)!)
        ownerNameLabel?.text = repo.ownerName()
        starCountLabel?.text = formatCount(repo.stargazersCount)
    }
}
