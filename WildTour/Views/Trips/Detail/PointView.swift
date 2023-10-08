//
//  PointView.swift
//  WildTour
//
//  Created by Kirill Polyakov on 18.03.2023.
//

import SwiftUI

struct PointView: View {

    var point: Point

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .padding(.leading, 25)

            VStack(alignment: .leading, spacing: 5) {
                Text(point.name)
                        .font(.headline)
                Text(point.formattedAddress)
                        .font(.subheadline)
            }
                    .padding(.leading, 20)

            Spacer()
                    .padding(.trailing, 25)
        }
    }
}

struct PointView_Previews: PreviewProvider {

    static let modelData = MockData()


    static var previews: some View {
        let point = modelData.trips[0].route!.steps[0].startPoint

        PointView(point: point)
    }
}
