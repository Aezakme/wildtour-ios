//
//  ProfileEditor.swift
//  WildTour
//
//  Created by Kirill Polyakov on 26.12.2022.
//

import SwiftUI

struct ProfileEditor: View {

    @Environment(\.editMode) private var editMode

    @Environment(\.isLogoutSuccessful) private var isLogoutSuccessful

    @Environment(\.showProfileEditor) private var showProfileEditor

    @State private var fakeToggle: Bool = true

    var profile: Profile

    var host: String

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: .constant(profile.login ?? "text"))
            }

            HStack {
                Text("Email").bold()
                Divider()
                TextField("Email", text: .constant(profile.email ?? "text"))
            }

            Toggle(isOn: $fakeToggle) {
                Text("Enable Notifications").bold()
            }

            HStack {
                Text("Host ").bold()
                Divider()
                TextField("Email", text: .constant(host ?? "text"))
            }

            Button("Logout", role: .destructive) {
                LoginService.logout()

                isLogoutSuccessful.wrappedValue = true
                showProfileEditor.wrappedValue = false
            }

        }
    }

}

struct ProfileEditor_Previews: PreviewProvider {

    static var previews: some View {
        ProfileEditor(profile: MockData().profile, host: "local")
    }
}
