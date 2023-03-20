//
//  RoadView.swift
//  WildTour
//
//  Created by Kirill Polyakov on 18.03.2023.
//

import SwiftUI

struct RoadView: View {

    var step: Step

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Spacer()
                Rectangle()
                        .frame(width: 4, height: 70)
                        .foregroundColor(.gray)
                        .padding(.leading, 34)
                        .padding(.trailing, 3)
                Spacer()

            }

            VStack(alignment: .leading, spacing: 10) {
                Text(String(step.distance) + " m")
                        .font(.subheadline)
                Text(step.travelMode)
                        .font(.subheadline)
            }
                    .padding(.leading, 10)
            Spacer()

            VStack(alignment: .trailing, spacing: 5) {
                NavigationLink {
                    TripStep(step: step)
                } label: {
                    Image(systemName: "chevron.right")
                            .padding(.all, 1.0)
                            .font(.system(size: 25))
                            .foregroundColor(Color.black)
                }

            }

        }
    }
}

struct RoadView_Previews: PreviewProvider {
    static let modelData = MockData()

    static var previews: some View {
        RoadView(step: modelData.trips[0].route.steps[0])
    }
}
