//
//  ColorSetDemo.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 17/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct ColorSetView: View {
    // Using an ObservedObject for reference-based data (classes)
    @ObservedObject private var colorSet = ColorSet()

    // @State property to control when chooser is displayed
    @State private var showChooser = false

    var body: some View {
        ZStack {
            colorSet.backgroundColor
                .edgesIgnoringSafeArea(.all)

            Image(systemName: "ant.fill")
                .foregroundColor(colorSet.foregroundColor)
                .font(.system(size: 200))

            VStack {
                Spacer()

                Button(action: { self.showChooser = true }) {
                    Text("Change Colors")
                        .frame(width: 170, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
        .sheet(isPresented: $showChooser) {
            // present the sheet, passing the ObservedObject
            // notice that this does not use $ as the ColorChooser
            // will get a reference to the ColorSet object
            ColorChooser(colorSet: self.colorSet)

            // changes to this object get passed back automatically
            // and used to update this view
        }
    }
}

struct ColorSetDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorSetView()
    }
}
