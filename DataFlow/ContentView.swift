//
//  ContentView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 0

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Property()) {
                    ListContents(title: "Property", imageNumber: 1)
                }

                NavigationLink(destination: UsingState()) {
                    ListContents(title: "@State", imageNumber: 2)
                }

                NavigationLink(destination: Numbers()) {
                    ListContents(title: "@State & @Binding 1", imageNumber: 3)
                }

                NavigationLink(destination: PizzaView()) {
                    ListContents(title: "@State & @Binding 2", imageNumber: 4)
                }

                NavigationLink(destination: PersonListView()) {
                    ListContents(title: "@ObservableObject", imageNumber: 5)
                }

                NavigationLink(destination: NestingViews().environmentObject(UserSettings())) {
                    ListContents(title: "@EnvironmentObject", imageNumber: 6)
                }
            }
            .navigationBarTitle("Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListContents: View {
    let title: String
    let imageNumber: Int

    var body: some View {
        HStack {
            Image(systemName: "\(imageNumber).square")
                .padding()
                .font(.largeTitle)
            Text(title)
                .font(.headline)
        }
    }
}
