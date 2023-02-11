import SwiftUI

struct TripRow: View {
    
    var trip: Trip
    
    var body: some View {
        HStack {
            trip.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(trip.name)
            
            Spacer()
            
            if trip.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var trips = ModelData().trips
    static var previews: some View {
        Group {
            TripRow(trip: trips[0])
            TripRow(trip: trips[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
