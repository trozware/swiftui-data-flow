//
//  PersonDetailView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonDetailView: View {
    @Binding var person: PersonViewModel

    var body: some View {
        VStack {
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
                        .keyboardType(.phonePad)
                }

                Section(header: Text("Address")) {
                    TextField("Address", text: $person.address)
                        .autocapitalization(.words)
                    TextField("City", text: $person.city)
                         .autocapitalization(.words)
                    TextField("State", text: $person.state)
                         .autocapitalization(.words)
                    TextField("Zip", text: $person.zip)
                }
            }

            Text("\(person.first) \(person.last)")
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let person = PersonViewModel.samplePerson()
        return PersonDetailView(person: .constant(person))
    }
}
