import SwiftUI

struct TripListView: View {

    @EnvironmentObject var network: UserData

    @State private var showingProfile = false
    @State private var isLogoutSuccessful = false
    @State private var isCreateNewPressed = false
    @State private var showFavoritesOnly = false


    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }

                    ForEach(network.userTrips) { trip in
                        NavigationLink {
                            TripDetailView(trip: trip)
                        } label: {
                            TripRow(trip: trip)
                        }
                    }
                }
            }
                    .navigationTitle("My Trips")


//            NavigationLink(destination: CreateNewTripSelectionView()) {
//                Text("New trip!")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                        .padding()
//            }


            NavigationLink("", destination: EmptyView())
                    .navigationDestination(isPresented: $isLogoutSuccessful) {
                        LoginView().navigationBarBackButtonHidden(true)
                    }
        }

                .onAppear {
                    network.getTrips()
                    network.getUser()
                }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        TripListView().environmentObject(MockData())
    }
}
