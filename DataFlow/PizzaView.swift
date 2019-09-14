//
//  PizzaView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PizzaView: View {
    @State private var pizza = Pizza()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    PizzaNamePicker(selectedPizzaName: $pizza.name)
                    PizzaSizePicker(selectedPizzaSize: $pizza.size)
                    PizzaCrustPicker(selectedPizzaCrust: $pizza.crust)
                }

                Text(pizza.pizzaSelection)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .navigationBarTitle("Choose Your Pizza")
        }
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView()
    }
}

struct PizzaNamePicker: View {
    @Binding var selectedPizzaName: PizzaName

    var body: some View {
        Section(header: Text("Select your pizza:").font(.headline)) {
            List(PizzaName.allCases, id: \.self) { pizzaName in
                Button(action: { self.selectedPizzaName = pizzaName }) {
                    PizzaNamePickerRow(selectedPizzaName: self.$selectedPizzaName,
                                       pizzaName: pizzaName)
                }
            }
        }
    }
}

struct PizzaNamePickerRow: View {
    @Binding var selectedPizzaName: PizzaName
    let pizzaName: PizzaName

    var body: some View {
        HStack {
            Text(pizzaName.rawValue.capitalized)
            Spacer()
            if pizzaName == self.selectedPizzaName {
                Image(systemName: "checkmark")
            }
        }
        .foregroundColor(.primary)
    }
}

struct PizzaSizePicker: View {
    @Binding var selectedPizzaSize: PizzaSize

    var body: some View {
        Section(header: Text("Select your size:").font(.headline)) {
            Picker(selection: $selectedPizzaSize, label: Text("Pizza Size")) {
                ForEach(PizzaSize.allCases, id: \.self) { pizzaSize in
                    Text(pizzaSize.rawValue.capitalized).tag(pizzaSize)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct PizzaCrustPicker: View {
    @Binding var selectedPizzaCrust: PizzaCrust

    var body: some View {
        Section(header: Text("Select your crust:").font(.headline)) {
            Picker(selection: $selectedPizzaCrust, label: Text("Pizza Crust")) {
                ForEach(PizzaCrust.allCases, id: \.self) { pizzaCrust in
                    Text(pizzaCrust.rawValue.capitalized).tag(pizzaCrust)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
