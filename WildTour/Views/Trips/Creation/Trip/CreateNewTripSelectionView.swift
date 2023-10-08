//
// Created by Kirill Polyakov on 21.03.2023.
//

import SwiftUI
import MapKit

struct CreateNewTripSelectionView: View {


    var body: some View {
        NavigationStack {
            NavigationLink(destination: CreateNewTripManuallyView()) {
                Text("I'll do it by my self")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
            }

            NavigationLink(destination: CreateNewTripAIView()) {
                Text("Let's do some magic!")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding()
            }
        }
                .navigationBarTitle("test")
    }
}


struct CreateNewTripSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTripSelectionView()
    }
}

