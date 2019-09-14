//
//  Pizza.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import Foundation

struct Pizza {
    var name: PizzaName = .magharita
    var size: PizzaSize = .medium
    var crust: PizzaCrust = .standard

    var pizzaSelection: String {
        return "You have selected a \(size.rawValue) \(name.rawValue.capitalized) pizza with a \(crust.rawValue) crust."
    }
}

enum PizzaName: String, CaseIterable {
    case magharita, hawaiian, pepperoni, vegetarian, seafood, mushroom
}

enum PizzaSize: String, CaseIterable {
    case small, medium, large
}

enum PizzaCrust: String, CaseIterable {
    case thin, standard, deeppan = "deep pan"
}

