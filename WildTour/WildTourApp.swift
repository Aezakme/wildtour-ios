//
//  WildTourApp.swift
//  WildTour
//
//  Created by Kirill Polyakov on 21.12.2022.
//

import SwiftUI

@main
struct WildTourApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
