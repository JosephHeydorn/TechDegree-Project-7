import Foundation
struct MovieResultsData: Decodable {
    let results: [MovieData]
}

struct MovieData: Codable {
    let title: String
}
