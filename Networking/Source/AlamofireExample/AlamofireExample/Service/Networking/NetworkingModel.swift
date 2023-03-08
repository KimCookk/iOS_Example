// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let networkTest = try? JSONDecoder().decode(NetworkTest.self, from: jsonData)

import Foundation

// MARK: - NetworkTestElement
struct NetworkTestElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias NetworkTest = [NetworkTestElement]
