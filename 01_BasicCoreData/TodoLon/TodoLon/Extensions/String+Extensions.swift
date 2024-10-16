//
//  String+Extensions.swift
//  TodoLon
//
//  Created by Rene Alonzo Choque Saire on 16/10/24.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool
    {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
