//
//  String+Extensions.swift
//  BudgetAppLon
//
//  Created by MacBookAir2019 on 17/10/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
