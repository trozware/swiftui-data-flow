//
//  ContentView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

// For demo purposes, it would be neat to make this a tab view
// then link to each of the main sample views


struct ContentView: View {
    // Property
    let greeting = "Hello from SwiftUI!"

    // State
    @State private var toggleValue = true
    @State private var stepperValue = 0

    var body: some View {
        VStack {
            // Using property directly
            Text(greeting)
                .font(.title)

            // Using state with 2-way binding
            Toggle(isOn: $toggleValue) {
                Text("Toggle is \(self.toggleValue ? "ON" : "OFF")")
            }
            .padding()

            // Using state with 2-way binding
            NumberChooser(stepperValue: $stepperValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

