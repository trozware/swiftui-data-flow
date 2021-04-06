//
//  UsingState.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 16/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct UsingState: View {
    @State private var toggleValue = true

    var body: some View {
        // Using state with 2-way binding
        Toggle(isOn: $toggleValue) {
            Text("Toggle is \(toggleValue ? "ON" : "OFF")")
        }
        .padding(50)
    }
}

struct UsingState_Previews: PreviewProvider {
    static var previews: some View {
        UsingState()
    }
}
