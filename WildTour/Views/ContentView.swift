//
//  ContentView.swift
//  WildTour
//
//  Created by Kirill Polyakov on 21.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TripList()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
