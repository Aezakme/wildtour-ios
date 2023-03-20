//
//  WildTourApp.swift
//  WildTour
//
//  Created by Kirill Polyakov on 21.12.2022.
//

import SwiftUI

@main
struct WildTourApp: App {

    @StateObject private var modelData = MockData()

    private var network = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
                    .environmentObject(network)
        }
    }
}
