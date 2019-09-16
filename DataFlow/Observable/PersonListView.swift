//
//  PersonList.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonListView: View {
    // Using an ObservedObject for reference-based data (classes)
    @ObservedObject var personList = PersonListModel()

    var body: some View {
        // Embed in NavigationView to test in isolation
        // Getting here through ContentView provides the master NavView

        // NavigationView {
            List {
                // To make the navigation link edits return to here,
                // the data sent must be a direct link to the ObservedObject
                
                ForEach(personList.persons.indices, id: \.self) { index in
                    NavigationLink(destination:
                        PersonDetailView(person: self.$personList.persons[index])
                    ) {
                        Text("\(self.personList.persons[index].first) \(self.personList.persons[index].last)")
                    }
                }
                .onDelete { indexSet in
                    // add this modifier to allow deleting from the list
                    self.personList.persons.remove(atOffsets: indexSet)
                }
                .onMove { indecies, newOffset in
                    // add this modifier to allow moving in the list
                    self.personList.persons.move(fromOffsets: indecies, toOffset: newOffset)
                }
            }

                // This runs when the view appears to load the initial data
                .onAppear(perform: { self.personList.fetchData() })

                // set up the navigation bar details
                // EditButton() is a standard View
                .navigationBarTitle("People")
                .navigationBarItems(trailing: EditButton())
        // }
    }
}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}

