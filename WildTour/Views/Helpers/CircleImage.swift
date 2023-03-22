//
//  CircleImage.swift
//  WildTour
//
//  Created by Kirill Polyakov on 22.12.2022.
//

import SwiftUI

struct CircleImage: View {

    var image: Image

    var body: some View {
        image
                .resizable()
                .frame(width: 150, height: 100)
                .cornerRadius(10)
                //                .clipShape(Circle())
                //                .overlay {
                //                    Circle().stroke(.white, lineWidth: 5)
                //                }
                .shadow(radius: 7)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("kirill"))
    }
}
