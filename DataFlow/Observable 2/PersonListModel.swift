//
//  PersonsModel.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import Foundation

class PersonListModel: ObservableObject {
    // Main list view model
    // ObservableObject so that updates are detected
    
    @Published var ids: [UUID] = []
    @Published var persons: [UUID : PersonViewModel] = [:]

    func fetchData() {
        // avoid too many calls to the API
        if ids.count > 0 { return }

        let address = "https://next.json-generator.com/api/json/get/VyQroKB8P?indent=2"
        guard let url = URL(string: address) else {
            fatalError("Bad data URL!")
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data")
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let dataArray = try jsonDecoder.decode([PersonModel].self, from: data)
                DispatchQueue.main.async {
                    let personViewModels = dataArray.map { PersonViewModel(with: $0) }.sorted() {
                        $0.last + $0.first < $1.last + $1.first
                    }
                    self.ids = personViewModels.map { $0.id }
                    self.persons = Dictionary(
                        uniqueKeysWithValues: personViewModels.map { ($0.id, $0) }
                    )
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func refreshData() {
        ids = []
        persons = [:]
        fetchData()
    }
}

class PersonViewModel: Identifiable, ObservableObject {
    
    // Main model for use as ObservableObject
    // Derived from JSON via basic model

    // Even though this is not observed directly,
    // it must be an ObservableObject for the data flow to work

    var id = UUID()
    var first: String = ""
    var last: String = ""
    var phone: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var zip: String = ""
    var registered: Date = Date()

    init(with person: PersonModel) {
        self.id = person.id
        self.first = person.first
        self.last = person.last
        self.phone = person.phone
        self.address = person.address
        self.city = person.city
        self.state = person.state
        self.zip = person.zip
        self.registered = person.registered
    }
    
    init() { }

}

struct PersonModel: Codable {
    // Basic model for decoding from JSON

    let id: UUID
    let first: String
    let last: String
    let phone: String
    let address: String
    let city: String
    let state: String
    let zip: String
    let registered: Date

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        first = try values.decode(String.self, forKey: .first)
        last = try values.decode(String.self, forKey: .last)
        phone = try values.decode(String.self, forKey: .phone)
        registered = try values.decode(Date.self, forKey: .registered)

        // split up address into separate lines for easier editing
        let addressData = try values.decode(String.self, forKey: .address)
        let addressComponents = addressData.components(separatedBy: ", ")
        address = addressComponents[0]
        city = addressComponents[1]
        state = addressComponents[2]
        zip = addressComponents[3]
    }
}

// Extension to force un-wrap a Dictionary value which is normally an optional.
// This is so it can be used to create a Binding.
extension Dictionary where Key == UUID, Value == PersonViewModel {
    subscript(unchecked key: Key) -> Value {
        get {
            guard let result = self[key] else {
                fatalError("This person does not exist.")
            }
            return result
        }
        set {
            self[key] = newValue
        }
    }
}
