import Foundation
import SwiftUI
import CoreLocation

struct Trip: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var rating: Float
    var visibility: String
    var isFavorite: Bool
    var createdAt: [Int]
    var updatedAt: [Int]
    var route: Route

//    private var imageName: String
    var image: Image {
        Image("silversalmoncreek")
    }

    struct Route: Hashable, Codable {
        var startPointId: Int
        var endPointId: Int
        var steps: [Step]
    }
}
