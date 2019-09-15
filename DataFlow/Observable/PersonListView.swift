//
//  PersonList.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonListView: View {
    @ObservedObject var personList = PersonsModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(personList.persons.indices, id: \.self) { index in
                    NavigationLink(destination:
                        PersonDetailView(person: self.$personList.persons[index])
                    ) {
                        Text("\(self.personList.persons[index].first) \(self.personList.persons[index].last)")
                    }
                }
                .onDelete { indexSet in
                    self.personList.persons.remove(atOffsets: indexSet)
                }
                .onMove { indecies, newOffset in
                    self.personList.persons.move(fromOffsets: indecies, toOffset: newOffset)
                }
            }
            .onAppear(perform: { self.personList.fetchData() })

            .navigationBarTitle("People")
            .navigationBarItems(leading: Button(action: { self.personList.fetchData() }) {
                Image(systemName: "arrow.clockwise")
            }, trailing: EditButton())
        }
    }

}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}

