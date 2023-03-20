//
//  NetworkUserData.swift
//  WildTour
//
//  Created by Kirill Polyakov on 18.03.2023.
//

import Foundation

class UserData: ObservableObject {


    @Published var trips: [Trip] = []
    @Published var profile: Profile? = nil

    func getTrips() {
        let url = URL(string: "http://localhost:8094/user/1/trips")!

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else {
                return
            }

            if response.statusCode == 200 {
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    do {
                        let decodedTrips = try JSONDecoder().decode([Trip].self, from: data)
                        self.trips = decodedTrips
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }

    func getUser() {
        let url = URL(string: "http://localhost:8094/user/1")!

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else {
                return
            }

            if response.statusCode == 200 {
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    do {
                        let decodedUser = try JSONDecoder().decode(Profile.self, from: data)
                        self.profile = decodedUser
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }

}
