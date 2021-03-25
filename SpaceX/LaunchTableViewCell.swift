//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import RxSwift

class LaunchTableViewCell: UITableViewCell, Configurable, GitRepositoryPresentable, ReusableView {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var customView: UIView!
    
    // MARK: - Configurable
    func configure(item: Any) {
        map(repo: item as? GitRepository)
    }
    
}
