//
//  ProfileSummary.swift
//  WildTour
//
//  Created by Kirill Polyakov on 25.12.2022.
//

import SwiftUI

struct ProfileSummary: View {

    var profile: Profile

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 20.0) {
                CircleImage(image: profile.avatar)

                VStack(alignment: .leading, spacing: 10) {

                    Text("\(profile.login!)").bold().font(.title2)
                    HStack {
                        Text("Full Name: ").bold().font(.system(size: 14))
                        Text("\(profile.fullName!)").font(.system(size: 14))
                    }
                    HStack {
                        Text("Email: ").bold().font(.system(size: 14))
                        Text("\(profile.email!)").font(.system(size: 14))
                    }
                }
            }
                    .padding(.vertical, 25)

            HStack {
                Text("Sex: ").bold()
                Text("\(profile.sex!)")
            }

            HStack {
                Text("Country code: ").bold()
                Text("\(profile.countryCode!)")
            }

            Divider()

            VStack(alignment: .leading) {
                Text("Bio")
                        .font(.headline)
                        .padding(.vertical, 10)
                ScrollView {
                    Text(profile.bio!)
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: MockData().profile)
    }
}
