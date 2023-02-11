//
//  Step.swift
//  WildTour
//
//  Created by Kirill Polyakov on 11.02.2023.
//

import Foundation


struct Step: Hashable, Codable, Identifiable {
    var id: UUID? = UUID()
    var startPoint: Point
    var endPoint: Point
    var distance : Distance
    var duration : Duration
    var travelMode: String
}
