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
    var email: String?
    var login: String?
    var fullName: String?
    var bio: String?
    var sex: String?
    var countryCode: String?
    var imageUrl: URL?
    
    
    //    private var avatarName: String = ""
    public var avatar: Image {
        Image("avatar")
    }
    
    static let defaultProfile = Profile(login: "defaultProfile", bio: "Cute Panda", imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBW.jpg"))
}

struct ProfileCollection: Codable {
    var sample: [Profile]
}
