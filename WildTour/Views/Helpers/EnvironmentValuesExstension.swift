//
// Created by Kirill Polyakov on 22.03.2023.
//

import SwiftUI


extension EnvironmentValues {

    var isLogoutSuccessful: Binding<Bool> {
        get {
            self[isLogoutSuccessfulValue.self]
        }
        set {
            self[isLogoutSuccessfulValue.self] = newValue
        }
    }

    var showingProfile: Binding<Bool> {
        get {
            self[showingProfileValue.self]
        }
        set {
            self[showingProfileValue.self] = newValue
        }
    }
}

struct isLogoutSuccessfulValue: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}


struct showingProfileValue: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}