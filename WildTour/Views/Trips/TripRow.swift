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
    static var trip = MockData().trips[0]
    static var previews: some View {
        Group {
            TripRow(trip: trip)
        }
                .previewLayout(.fixed(width: 300, height: 70))
    }
}
