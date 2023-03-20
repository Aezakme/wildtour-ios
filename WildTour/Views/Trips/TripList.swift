import SwiftUI

struct TripList: View {
    
    @EnvironmentObject var network: UserData
    
    @State private var showingProfile = false
    @State private var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(network.trips) { trip in
                    NavigationLink {
                        TripDetail(trip: trip)
                    } label: {
                        TripRow(trip: trip)
                    }
                }
            }
            .navigationTitle("My Trips")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost(profile: network.profile!)
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
