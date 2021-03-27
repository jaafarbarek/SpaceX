//
//  String+ToDate.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
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
