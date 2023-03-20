//
//  Step.swift
//  WildTour
//
//  Created by Kirill Polyakov on 11.02.2023.
//

import Foundation


struct Step: Hashable, Codable, Identifiable {
    var id: Int? = 0
    var startPoint: Point
    var endPoint: Point
    var distance : Int
    var duration : Int
    var travelMode: String
}
