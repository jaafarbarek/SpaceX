//
//  String+ToDate.swift
//  Matic
//
//  Created by MATIC on 6/9/19.
//  Copyright © 2019 Software Brothers. All rights reserved.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = format
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: self)
        return date
    }
}
