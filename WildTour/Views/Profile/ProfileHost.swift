//
//  ProfileHost.swift
//  WildTour
//
//  Created by Kirill Polyakov on 25.12.2022.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modelData: ModelData
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
                
            }
            
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $modelData.profile)
            }
        }
        .padding()
        
    }
    
}

struct ProfileHost_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
        
    }
}
