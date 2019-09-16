//
//  Numbers.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 16/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct Numbers: View {
    @State private var stepperValue = 0

    var body: some View {
        NumberChooser(stepperValue: $stepperValue)
    }
}

struct Numbers_Previews: PreviewProvider {
    static var previews: some View {
        Numbers()
    }
}

struct NumberChooser: View {
    // Using state from parent with 2-way binding
    @Binding var stepperValue: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.init(red: 0.95, green: 0.95, blue: 0.95))

            VStack {
                // Using bound state from parent with 2-way binding
                Stepper(value: $stepperValue, in: 0...20) {
                    Text("Value = \(stepperValue)")
                }
                .padding()

                // Using bound state from parent as property
                // this view cannot change the value
                NumberBlock(stepperValue: stepperValue)
            }
        }
        .padding()
    }
}

struct NumberBlock: View {
    // As this view never changes the value, there is no need to bind it
    var stepperValue: Int

    var body: some View {
        Image(systemName: "\(stepperValue).square")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .padding(.bottom, 20)
    }
}

