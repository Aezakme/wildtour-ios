//
// Created by Kirill Polyakov on 23.03.2023.
//

import Foundation


struct TripToCreate: Hashable, Codable {
    var name: String
    var description: String
    var startPoint: PointToCreate
    var endPoint: PointToCreate
}
