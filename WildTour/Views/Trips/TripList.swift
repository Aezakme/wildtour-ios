import SwiftUI

struct TripList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    @State private var showFavoritesOnly = false
    
    var filteredTrips: [Trip] {
        modelData.trips.filter { trip in
            (!showFavoritesOnly || trip.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredTrips) { trip in
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
                            ProfileHost()
                                .environmentObject(modelData)
                        }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        TripList()
            .environmentObject(ModelData())
    }
}
