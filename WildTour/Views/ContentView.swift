//
//  ContentView.swift
//  WildTour
//
//  Created by Kirill Polyakov on 21.12.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        if LoginService.isLogged() {
            TabView {
                TripListView()
                        .tabItem {
                            Label("Trips", systemImage: "list.bullet")
                        }

                Text("TBD")
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }

                CreateNewTripSelectionView()
                        .tabItem {
                            Label("Create", systemImage: "plus.circle")
                        }

                ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
            }

                    .accentColor(.blue)
        } else {
            LoginView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MockData())
    }
}
