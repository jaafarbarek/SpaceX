//
//  LaunchCellRepresentable.swift
//  SpaceX
//
//  Created by Jaafar Barek on 25/03/2021.
//

import RxSwift
import Kingfisher

protocol LaunchPresentable {
    
    var nameLabel: UILabel! {set get}
    var descriptionLabel: UILabel! {set get}
    var dateLabel: UILabel! {set get}
    var numberLabel: UILabel! {set get}
    var upcomingLabel: UILabel! {set get}
    var customView: UIView! {set get}
    var upcomingView: UIView! {set get}
    var disposeBag : DisposeBag {set get}
}

extension LaunchPresentable {
    func map(viewModel: LaunchCellViewModel) {
        
        nameLabel.text = viewModel.displayName
        descriptionLabel.text = viewModel.detailsText
        dateLabel.text = viewModel.dateText
        
        if let flightNumber = viewModel.flightNumber {
            numberLabel.text = "#\(flightNumber)"
        }
        
        upcomingView.isHidden = !viewModel.isUpcoming
    }
}
