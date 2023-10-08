//
// Created by Kirill Polyakov on 21.03.2023.
//

import SwiftUI
import MapKit

struct AddNewStepView: View {

    @EnvironmentObject var userData: UserData

    @State private var city: String = ""
    @State private var date: Date = Date()
    @State private var created: Bool = false
    @State private var searchCompleter = MKLocalSearchCompleter()
    @State private var searchCompleterDelegate = SearchCompleterDelegate()

    var trip: Trip

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

                VStack {
                    Text("Date:")
                    DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                }

                Spacer()

                Button(action: {
                    addNewStep()

                    created = true
                }) {
                    Text("Add step")
                }
                        .buttonStyle(BlueButton())

                NavigationLink("", destination: EmptyView())
                        .navigationDestination(isPresented: $created) {
                            Text("Created!").navigationBarBackButtonHidden(false)
                        }
            }
                    .padding(.bottom, 15)
        }
                .navigationTitle("Add step")
                .navigationBarTitleDisplayMode(.inline)

                .onAppear {
                    searchCompleter.delegate = searchCompleterDelegate
                }
    }

    private func addNewStep() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"


        var lastStep = trip.route?.steps.last
        var step = StepToCreate(tripId: trip.id, startPointId: lastStep!.id!,
                endPoint: PointToCreate(name: city, lat: selectedCoordinate.latitude, lng: selectedCoordinate.longitude, date: dateFormatter.string(from: date) + "T00:00:00.000Z"),
                travelMode: TravelMode.DRIVING)

        userData.addNewPoint(stepToCreate: step)
    }
}

struct CreateNewTrip1_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTripAIView()
    }
}

