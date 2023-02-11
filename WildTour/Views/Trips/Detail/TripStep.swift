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
                Text(step.distance.humanReadable)
                Text(step.duration.humanReadable)
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
    static var trips = ModelData().trips
    static var previews: some View {
        Group {
            TripStep(step: trips[0].route.steps[0])
            TripStep(step: trips[1].route.steps[1])
        }
        .previewLayout(.fixed(width: 300, height: 140))
    }
}
