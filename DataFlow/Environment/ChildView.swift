//
//  ChildView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 15/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    // Because this view does not use the data, there is no need to pass
    // it down to it, but its child can still access that data.

    var body: some View {
        ZStack {
            Color.green

            VStack {
                Text("This view has no data.")
                Text("But it has a child that does.")

                GrandChildView().padding()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview must have access to the required environment object
        // because this view previews its child which uses it
        ChildView()
            .environmentObject(UserSettings())
    }
}
