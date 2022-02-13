//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by max on 13.02.2022.
//

import Foundation

extension Date {
    func convertToMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
