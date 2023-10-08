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

    var showProfileEditor: Binding<Bool> {
        get {
            self[showProfileEditorValue.self]
        }
        set {
            self[showProfileEditorValue.self] = newValue
        }
    }
}

struct isLogoutSuccessfulValue: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}


struct showProfileEditorValue: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}