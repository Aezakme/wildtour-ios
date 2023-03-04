//
//  ProfileEditor.swift
//  WildTour
//
//  Created by Kirill Polyakov on 26.12.2022.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Environment(\.editMode) private var editMode
    
    @Binding var profile: Profile
    
    var body: some View {
        NavigationView {
            List {
                
                HStack {
                    Text("Username").bold()
                    Divider()
                    TextField("Username", text: .constant(profile.username ?? "text"))
                }
                
                Toggle(isOn: $profile.prefersNotifications) {
                    Text("Enable Notifications").bold()
                }
                
                Button(action: {
                    LoginService.logout()
                    editMode?.wrappedValue = .inactive  //Go to login page
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(8)
                    
                }
                .padding()
            }
        }
    }
    
    struct ProfileEditor_Previews: PreviewProvider {
        
        static var previews: some View {
            ProfileEditor(profile: .constant(ModelData().profile))
        }
    }
}
