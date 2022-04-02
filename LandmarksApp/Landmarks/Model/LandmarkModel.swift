//
//  Created by SubvertDev on 21/03/2022.
//

struct LandmarkModel: Codable {
    let name: String
    let category: String
    let city: String
    let state: String
    let id: Int
    let park: String
    let coordinates: Coordinates
    let imageName: String
    let isFavorite: Bool
}

struct Coordinates: Codable {
    let longitude: Double
    let latitude: Double
}
