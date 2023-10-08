//
// Created by Kirill Polyakov on 23.03.2023.
//

import Foundation

struct StepToCreate: Hashable, Codable {
    var tripId: Int
    var startPointId: Int
    var endPoint: PointToCreate
    var travelMode: TravelMode
}