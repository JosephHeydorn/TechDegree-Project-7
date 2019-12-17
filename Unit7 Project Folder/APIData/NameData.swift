import Foundation
struct NameResultsData: Decodable {
    let results: [NameData]
}

struct NameData: Codable {
    let name: String
    let id: Int
}
