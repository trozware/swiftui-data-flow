//
//  Property.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 16/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct Property: View {
    // Property
    let greeting = "Hello from SwiftUI!"

    var body: some View {
        // Using property directly
         Text(greeting)
             .font(.title)
    }
}

struct Property_Previews: PreviewProvider {
    static var previews: some View {
        Property()
    }
}
