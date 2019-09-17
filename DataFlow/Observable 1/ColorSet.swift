//
//  ColorSet.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 17/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

class ColorSet: ObservableObject {

    // ObservableObject
    // The 6 color components are marked as @Published so any changes
    // get published to the views that are observing

    @Published var foregroundRed = 0.0
    @Published var foregroundGreen = 0.0
    @Published var foregroundBlue = 0.0
    
    @Published var backgroundRed = 1.0
    @Published var backgroundGreen = 1.0
    @Published var backgroundBlue = 1.0

    // Computed variables to create the RGB colors from the components

    var foregroundColor: Color {
        return Color(red: foregroundRed, green: foregroundGreen, blue: foregroundBlue)
    }
    
    var backgroundColor: Color {
        return Color(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue)
    }
}
