//
//  LandmarkDetail.swift
//  WildTour
//
//  Created by Kirill Polyakov on 22.12.2022.
//

import SwiftUI
import MapKit

struct TripDetail: View {


    //    @EnvironmentObject var modelData: ModelData

    var trip: Trip


    var tripsIndex: Int {
        trip.id
    }

    var body: some View {
        ScrollView {
            //Кажется тут каша и вообще не тру в идеале карта всего маршрута
            MapView(coordinate: CLLocationCoordinate2D(latitude: trip.route.steps[0].startPoint.lat, longitude: trip.route.steps[0].startPoint.lng))
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)

//            CircleImage(image: trip.image)
//                .offset(y: -130)
//                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(trip.description).font(.title2)

                Text("From: \(trip.route.startPointId.codingKey.stringValue) To: \(trip.route.endPointId.codingKey.stringValue)")

                Divider()

                ForEach(trip.route.steps) { step in
                    PointView(point: step.startPoint)
                    RoadView(step: step)
                }

                var step = trip.route.steps.last!
                PointView(point: step.endPoint)
            }
                    .padding()

            Spacer()
        }
                .navigationTitle(trip.name)
                .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = MockData()

    static var previews: some View {
        TripDetail(trip: modelData.trips[0]).environmentObject(modelData)
    }
}
