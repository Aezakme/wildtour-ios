//
//  TripStep.swift
//  WildTour
//
//  Created by Kirill Polyakov on 11.02.2023.
//

import SwiftUI

struct TripStep: View {

    var step: Step

    var body: some View {
        HStack {
            VStack {
                Text("\(step.distance) meters")
                Text("\(step.duration) min")
                Text(step.travelMode)
            }
            Text("====>")
            VStack {
                Text(step.startPoint.name)
                Text(step.startPoint.formattedAddress)


                Text("|/")


                Text(step.endPoint.name)
                Text(step.endPoint.formattedAddress)
            }
        }
    }
}

struct TripStep_Previews: PreviewProvider {
    static var trip = MockData().trips[0]
    static var previews: some View {
        Group {
            TripStep(step: trip.route.steps[0])
        }
                .previewLayout(.fixed(width: 300, height: 140))
    }
}
