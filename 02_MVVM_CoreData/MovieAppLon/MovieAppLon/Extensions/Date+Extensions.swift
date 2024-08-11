//
//  Date+Extensions.swift
//  MovieAppLon
//
//  Created by Rene Alonzo Choque Saire on 10/8/24.
//

import Foundation
extension Date {
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
