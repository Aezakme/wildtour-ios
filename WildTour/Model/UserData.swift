//
//  NetworkUserData.swift
//  WildTour
//
//  Created by Kirill Polyakov on 18.03.2023.
//

import Foundation

class UserData: ObservableObject {

    @Published var userTrips: [Trip] = []
    @Published var profile: Profile? = nil

    var mockData: MockData = MockData()

    let baseUrl = "http://localhost:8094"

    func getTrips() {
        let urlRequest = createGetRequest(path: "/user/1/trips")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                self.userTrips = self.mockData.trips
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
                        self.userTrips = decodedTrips
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }

    func getUser() {
        let url = URL(string: baseUrl + "/user/1")!

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                self.profile = self.mockData.profile
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

    func createNewTrip(tripToCreate: TripToCreate) {
        print("post new trip")

        var urlRequest = createUrlPostRequest(path: "/user/1/trip")

        if let data = try? JSONEncoder().encode(tripToCreate) {
            urlRequest.httpBody = data
            print(String(data: data, encoding: .utf8)!)
        }


        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                self.profile = self.mockData.profile
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
                        print(String(data: data, encoding: .utf8)!)
//                        let decodedUser = try JSONDecoder().decode(Profile.self, from: data)
//                        self.profile = decodedUser
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else {
                print("\(response)")
            }
        }

        dataTask.resume()
    }

    func addNewPoint(stepToCreate: StepToCreate) {
        print("post add point")
        var urlRequest = createUrlPostRequest(path: "/user/1/trip")

        if let data = try? JSONEncoder().encode(stepToCreate) {
            urlRequest.httpBody = data
            print(String(data: data, encoding: .utf8)!)
        }


        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                self.profile = self.mockData.profile
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
                        print(String(data: data, encoding: .utf8)!)
//                        let decodedUser = try JSONDecoder().decode(Profile.self, from: data)
//                        self.profile = decodedUser
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else {
                print("\(response)")
            }
        }

        dataTask.resume()
    }

    private func createUrlPostRequest(path: String) -> URLRequest {
        let url = URL(string: baseUrl + path)!

        var urlRequest = URLRequest(url: url)

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "POST"
        return urlRequest
    }

    private func createGetRequest(path: String) -> URLRequest {
        let url = URL(string: baseUrl + path)!

        let urlRequest = URLRequest(url: url)
        return urlRequest
    }

}
