//
//  Profile.swift
//  WildTour
//
//  Created by Kirill Polyakov on 25.12.2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Profile : Hashable, Codable, Identifiable {
    var id: Int
    var username: String
    var email: String
    var password: String
    var bio: String
    var prefersNotifications = true
    
    private var avatarName: String
    var avatar: Image {
        Image(avatarName)
    }
}
