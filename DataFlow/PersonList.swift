//
//  Person.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 14/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import Foundation

class PersonList: ObservableObject {

    @Published var persons: [Person] = []

    func fetchData() {
        let address = "https://next.json-generator.com/api/json/get/VyQroKB8P?indent=2"
        guard let url = URL(string: address) else {
            fatalError("Bad data URL!")
        }
        print("Fetching data")

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data")
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let dataArray = try jsonDecoder.decode([Person].self, from: data)
                DispatchQueue.main.async {
                    self.persons = dataArray.sorted() {
                        $0.last + $0.first < $1.last + $1.first
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

struct Person: Codable, Identifiable {
    let id: UUID
    var first: String
    var last: String
    var phone: String
    var address: String
    var city: String
    var state: String
    var zip: String
    let registered: Date
}

extension Person {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        first = try values.decode(String.self, forKey: .first)
        last = try values.decode(String.self, forKey: .last)
        phone = try values.decode(String.self, forKey: .phone)
        registered = try values.decode(Date.self, forKey: .registered)

        let addressData = try values.decode(String.self, forKey: .address)
        let addressComponents = addressData.components(separatedBy: ", ")
        address = addressComponents[0]
        city = addressComponents[1]
        state = addressComponents[2]
        zip = addressComponents[3]
    }
}
