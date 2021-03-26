//
//  Date+Dateable.swift
//  Matic
//
//  Created by MATIC on 6/8/19.
//  Copyright © 2019 Software Brothers. All rights reserved.
//

import Foundation

extension Date: Dateable {
    func getPortolioCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy - hh:mm"
        formatter.timeZone = .current
        return formatter.string(from: self)
    }
}
