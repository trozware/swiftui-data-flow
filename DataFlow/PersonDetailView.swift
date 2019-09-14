//
//  PersonDetailView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonDetailView: View {
    @State var person: Person

    var body: some View {
        Form {
            Section(header: Text("First Name")) {
                TextField("Enter first name", text: $person.first)
                    .autocapitalization(.words)
            }

            Section(header: Text("Last Name")) {
                TextField("Enter last name", text: $person.last)
                    .autocapitalization(.words)
            }

            Section(header: Text("Phone Number")) {
                TextField("Enter phone number", text: $person.phone)
                    .autocapitalization(.words)
            }

            Section(header: Text("Address")) {
                TextField("Address", text: $person.address)
                    .autocapitalization(.words)
                TextField("City", text: $person.city)
                     .autocapitalization(.words)
                TextField("State", text: $person.state)
                     .autocapitalization(.words)
                TextField("Zip", text: $person.zip)
                     .autocapitalization(.words)
            }

        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person(id: UUID(),
                            first: "Pickett",
                            last: "Young",
                            phone: "+1 (893) 528-2284",
                            address: "670 Taaffe Place",
                            city: "Greenbush",
                            state: "North Dakota",
                            zip: "625",
                            registered: Date())

        return PersonDetailView(person: person)
    }
}
