//
// Created by Kirill Polyakov on 23.03.2023.
//

import Foundation

struct PointToCreate: Hashable, Codable {
    var name: String
    var lat: Double
    var lng: Double
    var date: String
}