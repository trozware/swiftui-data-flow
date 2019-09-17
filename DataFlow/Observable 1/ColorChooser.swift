//
//  ColorChooser.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 17/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct ColorChooser: View {
    @ObservedObject var colorSet: ColorSet

    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.95, blue: 0.95)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // The 2 Chooser subviews also get passed the ObservedObject
                ForeColorChooser(colorSet: colorSet)

                Divider()

                BackColorChooser(colorSet: colorSet)

            }
        }
    }
}

struct ColorChooser_Previews: PreviewProvider {
    static var previews: some View {
        ColorChooser(colorSet: ColorSet())
    }
}

struct ForeColorChooser: View {
    @ObservedObject var colorSet: ColorSet

    var body: some View {
        Group {
            HStack {
                Text("Foreground Red:").frame(width: 150)
                Slider(value: $colorSet.foregroundRed, in: 0.0 ... 1.0)
            }.padding()

            HStack {
                Text("Foreground Green:").frame(width: 150)
                Slider(value: $colorSet.foregroundGreen, in: 0.0 ... 1.0)
            }.padding()

            HStack {
                Text("Foreground Blue:").frame(width: 150)
                Slider(value: $colorSet.foregroundBlue, in: 0.0 ... 1.0)
            }.padding()

            RoundedRectangle(cornerRadius: 20)
                .fill(colorSet.foregroundColor)
                .frame(height: 60)
                .padding()
        }
    }
}

struct BackColorChooser: View {
    @ObservedObject var colorSet: ColorSet

    var body: some View {
        Group {
            HStack {
                Text("Background Red:").frame(width: 150)
                Slider(value: $colorSet.backgroundRed, in: 0.0 ... 1.0)
            }.padding()

            HStack {
                Text("Background Green:").frame(width: 150)
                Slider(value: $colorSet.backgroundGreen, in: 0.0 ... 1.0)
            }.padding()

            HStack {
                Text("Background Blue:").frame(width: 150)
                Slider(value: $colorSet.backgroundBlue, in: 0.0 ... 1.0)
            }.padding()

            RoundedRectangle(cornerRadius: 20)
                .fill(colorSet.backgroundColor)
                .frame(height: 60)
                .padding()
        }
    }
}
