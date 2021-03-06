//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import Foundation

class LaunchCellViewModel {

    let launch: Launch

    init(launch: Launch) {
        self.launch = launch
    }
}

// MARK: Internal API
extension LaunchCellViewModel {
    var displayName: String {
        return launch.name ?? ""
    }

    var detailsText: String {
        return launch.details ?? ""
    }
    
    var flightNumber: Int? {
        return launch.flightNumber
    }
    
    var dateText: String {
        guard let utcDate = launch.date, let date = utcDate.toDate() else {
            return ""
        }

        return date.getPortolioCreatedDate()
    }
    
    var isUpcoming: Bool {
        return launch.upcoming ?? false
    }
}
