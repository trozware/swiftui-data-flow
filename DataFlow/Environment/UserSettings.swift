//
//  UserSettings.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 15/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import Foundation

// An EnvironmentObject class is just like any ObservableObject class

class UserSettings: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
