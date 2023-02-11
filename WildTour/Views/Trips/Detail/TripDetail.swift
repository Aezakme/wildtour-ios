//
//  LandmarkDetail.swift
//  WildTour
//
//  Created by Kirill Polyakov on 22.12.2022.
//

import SwiftUI

struct TripDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var trip: Trip
    
    var tripsIndex: Int {
        modelData.trips.firstIndex(where: { $0.id == trip.id })!
    }
    
    var body: some View {
        ScrollView {
//            MapView(coordinate: trip.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
            
            trip.image //Тут должна быть карта всего машрута
                  .resizable()
                  .frame(height: 300)
        
            CircleImage(image: trip.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            HStack {
                Text(trip.name)
                    .font(.title)
                FavoriteButton(isSet: $modelData.trips[tripsIndex].isFavorite)
            }
            
            VStack(alignment: .leading) {
                Text(trip.description).font(.title2)
                
                Text("From: \(trip.route.startPointId.codingKey.stringValue) To:\(trip.route.endPointId.codingKey.stringValue)")

                Divider()
                
                ForEach(trip.route.steps) { step in
                    NavigationLink {
                        TripStep(step: step)
                    } label: {
                        TripRow(trip: trip)
                    }
                    Divider()
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(trip.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TripDetail(trip: modelData.trips[0])
            .environmentObject(modelData)
    }
}
