//
//  PersonList.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonListView: View {
    @ObservedObject var personList = PersonList()

    var body: some View {
        NavigationView {
            List(personList.persons) { person in
                NavigationLink(destination: PersonDetailView(person: person)) {
                    HStack {
                        Text(person.first)
                        Text(person.last)
                    }
                }
            }
            .navigationBarTitle("People")
            .onAppear(perform: { self.personList.fetchData() })
        }
    }

}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}

