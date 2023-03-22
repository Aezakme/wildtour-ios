import SwiftUI

struct TripList: View {

    @EnvironmentObject var network: UserData

    @State private var showingProfile = false
    @State private var isLogoutSuccessful = false
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
                            TripDetail(trip: trip)
                        } label: {
                            TripRow(trip: trip)
                        }
                    }
                }
            }
                    .navigationTitle("My Trips")
                    .toolbar {
                        Button {
                            showingProfile.toggle()
                            isLogoutSuccessful = false
                        } label: {
                            Label("User Profile", systemImage: "person.crop.circle")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost(profile: network.profile!)
                                .environment(\.showingProfile, self.$showingProfile)
                                .environment(\.isLogoutSuccessful, self.$isLogoutSuccessful)
                    }

            NavigationLink(destination: CreateNewTrip()) {
                Text("New trip!")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
            }

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
        TripList().environmentObject(MockData())
    }
}
