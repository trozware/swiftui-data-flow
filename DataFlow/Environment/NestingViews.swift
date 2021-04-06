//
//  NestingViews.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 15/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct NestingViews: View {
    // Get access to global environment object
    @EnvironmentObject var userSettings: UserSettings

    // for demonstration purposes, the nested views have
    // different coloured backgrounds

    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)

            VStack {
                Text(userSettings.isLoggedIn
                    ? "User Logged In"
                    : "User Logged Out")
                    .padding()
                    .font(.title)

                // Button toggles value in environment object
                Button(action: { userSettings.isLoggedIn.toggle() }) {
                    Text(userSettings.isLoggedIn ? "Log Out" : "Log In")
                        .modifier(GrayButtonStyle())
                }
                .padding()

                Spacer()
                
                // display first nested view
                ChildView()
            }
        }
    }
}

struct NestingViews_Previews: PreviewProvider {
    static var previews: some View {
        // Preview must have access to the required environment object
        NestingViews()
            .environmentObject(UserSettings())
    }
}
