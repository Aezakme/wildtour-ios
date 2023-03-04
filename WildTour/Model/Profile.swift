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
    var id: Int?
    var username: String?
    var password: String?
    var email: String?
    var bio: String?
    var prefersNotifications = true
    var imageUrl: URL?
    
    private var avatarName: String = ""
    var avatar: Image {
        Image(avatarName)
    }
    
    static let defaultProfile = Profile(username: "defaultProfile", bio: "Cute Panda", imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBW.jpg"))
}

struct ProfileCollection: Codable {
    var sample: [Profile]
}
