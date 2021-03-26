//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import RxSwift

class LaunchTableViewCell: UITableViewCell, Configurable, LaunchPresentable, ReusableView {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var customView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    // MARK: - Configurable
    func configure(item: Any) {
        if let launch = item as? Launch {
            map(viewModel: LaunchCellViewModel(launch: launch))
        }
    }
}

// MARK: - Private helper methods
private extension LaunchTableViewCell {
    func configureViews() {
        nameLabel.applyStyle(textColor: .white, font: Fonts.font(name: .font700, size: 15))
        descriptionLabel.applyStyle(textColor: .blueGray, font: Fonts.font(name: .font300, size: 15))
        numberLabel.applyStyle(textColor: .white, font: Fonts.font(name: .font300, size: 13))
        dateLabel.applyStyle(textColor: .white, font: Fonts.font(name: .font300, size: 15))
        upcomingLabel.applyStyle(textColor: .curiousBlue, font: Fonts.font(name: .font700, size: 11))
        
        upcomingView.layer.cornerRadius = 6.0
        customView.layer.cornerRadius = 8.0
    }
}
