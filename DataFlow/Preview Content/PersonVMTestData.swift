//
//  PersonVMTestData.swift
//  DataFlow
//
//  Created by Sarah Reichelt on 22/09/2019.
//  Copyright © 2019 TrozWare. All rights reserved.
//

import Foundation

extension PersonViewModel {
    // Sample data for use in Previews only

    static func samplePerson() -> PersonViewModel {
        let json = """
        {
          "id": "07534800-9c07-4857-b931-d6541ff0df08",
          "first": "Beasley",
          "last": "Burnett",
          "phone": "+1 (957) 453-3538",
          "address": "740 Jodie Court, Manchester, Vermont, 8934",
          "registered": "2018-06-08T01:08:31+00:00"
        }
        """

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        // Uisng force un-wrapping for sample data only, not for production
        let person = try! jsonDecoder.decode(PersonModel.self, from: json.data(using: .utf8)!)
        return PersonViewModel(with: person)
    }
}
