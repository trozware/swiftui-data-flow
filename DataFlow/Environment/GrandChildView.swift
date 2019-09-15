//
//  GrandChildView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 15/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct GrandChildView: View {
    // This grandchild view now gets access to the environment object
    // even though its parent does not.

    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        ZStack {
            Color.blue

            VStack {
                if userSettings.isLoggedIn {
                    Image(systemName: "person.crop.square").padding()
                } else {
                    Image(systemName: "questionmark.square").padding()
                }

                // Toggling the environment object value changes
                // all the views that use it
                Button(action: { self.userSettings.isLoggedIn.toggle() }) {
                    userSettings.isLoggedIn
                        ? Text("Log Out").modifier(ButtonStyle())
                        : Text("Log In").modifier(ButtonStyle())
                }
            }
            .padding()
        }
        .foregroundColor(.white)
        .font(.system(size: 100))
    }
}

struct GrandChildView_Previews: PreviewProvider {
    static var previews: some View {
        GrandChildView()
            .environmentObject(UserSettings())
    }
}
