//
//  View+Extensions.swift
//  MovieAppLon
//
//  Created by Rene Alonzo Choque Saire on 10/8/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
