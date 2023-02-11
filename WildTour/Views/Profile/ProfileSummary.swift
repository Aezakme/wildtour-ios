//
//  ProfileSummary.swift
//  WildTour
//
//  Created by Kirill Polyakov on 25.12.2022.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    var body: some View {
        ScrollView {

            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 1.0){
                    CircleImage(image: profile.avatar)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(profile.username).bold().font(.title)
                        
                        
                        Text("Email: \(profile.email)")
                        Text("Password: \(profile.password)")
                        
                    }
                }
                .padding(.vertical, 50.0)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Bio")
                        .font(.headline)
                    Text("\(profile.bio)")
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: ModelData().profile)
            .environmentObject(ModelData())
    }
}
