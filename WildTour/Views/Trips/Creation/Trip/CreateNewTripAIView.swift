//
// Created by Kirill Polyakov on 21.03.2023.
//

import SwiftUI
import MapKit

struct CreateNewTripAIView: View {

    @State private var city: String = ""
    @State private var fromDate: Date = Date()
    @State private var toDate: Date = Date()
    @State private var searchCompleter = MKLocalSearchCompleter()
    @State private var searchCompleterDelegate = SearchCompleterDelegate()

    @State var selectedCoordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12) //Change to current on init

    let geocoder = CLGeocoder()
    let cityName = "New York"

    var body: some View {
        NavigationStack {
            MapView(coordinate: selectedCoordinate)
                    //                    .ignoresSafeArea(edges: .top)
                    .frame(height: 150)
                    .padding(.bottom, 15)

            VStack {

                Text("Coordinate: lat=\(selectedCoordinate.latitude) long=\(selectedCoordinate.longitude)")

                TextField("City", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: city, perform: { value in
                            searchCompleter.queryFragment = value
                        })

                List(searchCompleterDelegate.searchResults as [MKLocalSearchCompletion], id: \.self) { completion in
                    Text("\(completion.title)")
                            .onTapGesture {
                                city = completion.title
                                searchCompleterDelegate.searchResults.removeAll()

                                if completion.title != "" {
                                    geocoder.geocodeAddressString(cityName) { (placemarks, error) in
                                        if let error = error {
                                            print("Geocoding error: \(error.localizedDescription)")
                                        } else if let placemark = placemarks?.first {
                                            selectedCoordinate = placemark.location?.coordinate ?? CLLocationCoordinate2D()
                                        }
                                    }
                                }

                                searchCompleterDelegate.searchResults.removeAll()
                            }
                }
                        //                    .frame(height: 150)
                        .opacity(searchCompleterDelegate.searchResults.isEmpty ? 0 : 1)
                        .padding()

                DateRangePicker(startDate: $fromDate, endDate: $toDate)

                Spacer()

                Button(action: {
                    // TODO: Handle button tap
                }) {
                    Text("Next")
                }
                        .buttonStyle(BlueButton())
            }
                    .padding(.bottom, 15)
        }
                .navigationTitle("Create new trip")
                .navigationBarTitleDisplayMode(.inline)

                .onAppear {
                    searchCompleter.delegate = searchCompleterDelegate
                }
    }
}

class SearchCompleterDelegate: NSObject, MKLocalSearchCompleterDelegate {
    var searchResults: [MKLocalSearchCompletion] = []

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
    }
}

struct CreateNewTrip_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTripAIView()
    }
}

