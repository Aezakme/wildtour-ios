//
//  ProfileSummary.swift
//  WildTour
//
//  Created by Kirill Polyakov on 25.12.2022.
//

import SwiftUI

struct ProfileSummary: View {

    //    @EnvironmentObject var modelData: MockData

//    @EnvironmentObject var network: NetworkUserData


    var profile: Profile
//    var imageMetadata: Panda


    var body: some View {

        //Just internet check
        //        AsyncImage(url: imageMetadata.imageUrl) { phase in
        //                    if let image = phase.image {
        //                        image
        //                            .resizable()
        //                            .scaledToFit()
        //                            .cornerRadius(15)
        //                            .shadow(radius: 5)
        //                            .accessibility(hidden: false)
        //                            .accessibilityLabel(Text(imageMetadata.description))
        //                    }  else if phase.error != nil  {
        //                        VStack {
        //                            Text("The pandas were all busy.")
        //                                .font(.title2)
        //                            Text("Please try again.")
        //                                .font(.title3)
        //                        }
        //
        //                    } else {
        //                        ProgressView()
        //                    }
        //        }.task {
        //            try? await modelData.fetchData()
        //        }

        ScrollView {

            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 1.0) {
                    CircleImage(image: profile.avatar)

                    VStack(alignment: .leading, spacing: 10) {

                        Text("Username: \(profile.login!)").bold().font(.title)

                        Text("Email: \(profile.fullName!)")

                        Text("Pass: \(profile.email!)")


                    }
                }
                        .padding(.vertical, 50.0)

                Divider()

                VStack(alignment: .leading) {
                    Text("Bio")
                            .font(.headline)

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
