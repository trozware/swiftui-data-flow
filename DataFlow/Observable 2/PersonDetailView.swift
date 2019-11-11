//
//  PersonDetailView.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import SwiftUI

struct PersonDetailView: View {
    // Data passed from parent list view
    @ObservedObject var person: PersonViewModel

    // SwiftUI form with data fields
    // note the autocapitalization and keyboard modifiers

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

            Text("Registered on:")
                .font(.headline)
                .padding(6)
            Text("\(person.registered, formatter: dateFormatter)")
        }
    }

    // Formatter for registration date
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.timeStyle = .short
        df.dateStyle = .long
        return df
    }
}

// Previewing requires using .constant to convert the data to a binding
// Sample data is generated in an extension in Preview Content

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let person = PersonViewModel.samplePerson()
        return PersonDetailView(person: person)
    }
}
