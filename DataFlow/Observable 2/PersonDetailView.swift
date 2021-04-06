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
    @Binding var person: PersonViewModel

    // SwiftUI form with data fields
    // note the autocapitalization and keyboard modifiers

    var body: some View {
        VStack {
            Form {
                Section(header: Text("First Name")) {
                    TextField("Enter first name", text: $person.first)
                }

                Section(header: Text("Last Name")) {
                    TextField("Enter last name", text: $person.last)
                }

                Section(header: Text("Phone Number")) {
                    TextField("Enter phone number", text: $person.phone)
                        .keyboardType(.phonePad)
                }

                Section(header: Text("Address")) {
                    TextField("Address", text: $person.address)
                    TextField("City", text: $person.city)
                    TextField("State", text: $person.state)
                    TextField("Zip", text: $person.zip)
                }
            }
            .autocapitalization(.words)

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
        return PersonDetailView(person: .constant(person))
    }
}
