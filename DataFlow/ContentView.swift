//
//  ContentView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let greeting = "Hello SwiftUI!"
    @State private var toggleValue = true
    @State private var stepperValue = 0

    var body: some View {
        VStack {
            Text(greeting)

            Toggle(isOn: $toggleValue) {
                Text("Toggle is \(self.toggleValue ? "ON" : "OFF")")
            }
            .padding()

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
    @Binding var stepperValue: Int

    var body: some View {
        VStack {
            Stepper(value: $stepperValue, in: 0...20) {
                Text("\(stepperValue)")
            }
            .padding()

            NumberBlock(stepperValue: stepperValue)
        }
        .frame(width: 250, height: 190)
        .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
        .padding()
    }
}

struct NumberBlock: View {
    var stepperValue: Int

    var body: some View {
        Image(systemName: "\(stepperValue).square")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .padding()
    }
}

