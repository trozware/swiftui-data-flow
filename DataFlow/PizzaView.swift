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

                    Section(header: Text("Select your size:").font(.headline)) {
                        Picker(selection: $pizza.size, label: Text("Pizza Size")) {
                            ForEach(PizzaSize.allCases, id: \.self) { pizzaSize in
                                Text(pizzaSize.rawValue.capitalized).tag(pizzaSize)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section(header: Text("Select your crust:").font(.headline)) {
                        Picker(selection: $pizza.crust, label: Text("Pizza Crust")) {
                            ForEach(PizzaCrust.allCases, id: \.self) { pizzaCrust in
                                Text(pizzaCrust.rawValue.capitalized).tag(pizzaCrust)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }

                Text(pizza.pizzaSelection)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .navigationBarTitle("Choose your Pizza")
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
        Section(header: Text("Select your pizza:")  .font(.headline)) {
            List(PizzaName.allCases, id: \.self) { pizzaName in
                Button(action: { self.selectedPizzaName = pizzaName }) {
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
        }
    }
}
