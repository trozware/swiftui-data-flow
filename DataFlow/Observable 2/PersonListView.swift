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
    @StateObject var personList = PersonListModel()
    
    var body: some View {
        List {
            // To make the navigation link edits return to here,
            // the data sent must be a direct reference to an element
            // of the ObservedObject, not the closure parameter.
            
            // Thanks to Stewart Lynch (@StewartLynch) for suggesting using a function to
            // get a binding to the person so it coud be passed to the detail view.
            
            // And now thanks to Vadim Shpakovski (@vadimshpakovski) for another option
            // which does not rely on creating a binding to every person, but uses
            // onReceive to react to changes to the person and trigger an update of personList.
            // This will be faster for longer lists and feels more like how ObservedObject is meant to be used.
            // Note that PersonDetailView has changed from using @Binding to @ObservedObject.
            
            // And a further update after receiving some more feedback which suggested
            // that using @Binding was better as it means that the entire ForEach doid not have to be
            // re-calcaulted afetr every change. But this uses a Dictionary to avoid Stewart's function.
            
            ForEach(personList.ids, id: \.self) { id in
                NavigationLink(
                    destination: PersonDetailView(person: $personList.persons[unchecked: id])
                ) {
                    Text("\(personList.persons[unchecked: id].first)") +
                        Text(" \(personList.persons[unchecked: id].last)")
                }
            }
            .onDelete { indexSet in
                // add this modifier to allow deleting from the list
                personList.ids.remove(atOffsets: indexSet)
            }
            .onMove { indices, newOffset in
                // add this modifier to allow moving in the list
                personList.ids.move(fromOffsets: indices, toOffset: newOffset)
            }
        }
            
            // This runs when the view appears to load the initial data
            .onAppear(perform: { personList.fetchData() })
            
            // set up the navigation bar details
            // EditButton() is a standard View
            .navigationBarTitle("People")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: { personList.refreshData() }) {
                        Image(systemName: "arrow.clockwise")
                    }
                    Spacer().frame(width: 30)
                    EditButton()
                }
        )
    }
    
}

// To preview this with navigation, it must be embedded in a NavigationView
// but the main ContentView provides the main NavigationView
// so this view will only get its own when in Proview mode

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonListView()
        }
    }
}

