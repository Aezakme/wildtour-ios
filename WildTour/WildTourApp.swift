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
    
    @StateObject private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //                    .environmentObject(modelData)
                .environmentObject(userData)
            //Just for fun
                .onOpenURL { url in
                    print(url.scheme ?? "none")
                    print(url.host  ?? "none")
//                    print(url.lastPathComponent ?? "none")
                }
        }
    }
}
