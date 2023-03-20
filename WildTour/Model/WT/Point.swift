//
//  Point.swift
//  WildTour
//
//  Created by Kirill Polyakov on 11.02.2023.
//

import Foundation

struct Point: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var formattedAddress: String
    var url: String
    var lat: Double
    var lng: Double
    var externalId: String
    var photos: String
}
