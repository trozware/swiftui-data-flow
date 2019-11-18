//
//  CustomModifiers.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 15/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

// A custom view modifier so all the buttons can look the same
// without having to enter this amount of detail every time

struct GrayButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(width: 150, height: 40)
            .padding()
            .font(.title)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}
