//
//  LocalHostController.swift
//  WildTour
//
//  Created by Kirill Polyakov on 16.03.2023.
//

import UIKit
import CoreData
import Foundation

class LocalHostConrtoller {
    
    var returnData:Data? = nil
    
    private var responseData = ""
    
    //    lazy var persistentContainer: NSPersistentContainer = {
    //        let container = NSPersistentContainer(name: "TestDataModelName")
    //        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    //            if let error = error as NSError? {
    //                print("Unresolved error \(error), \(error.userInfo)")
    //            }
    //        })
    //        return container
    //    }()
    //
    func viewDidLoad(completion : @escaping (String) -> Void){
        //        super.viewDidLoad()
        
        // Perform GET request
        // let url = URL(string: "https://raw.githubusercontent.com/Aezakme/wildtour-ios/main/db.json")!
        //            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//        let url = URL(string: "http://localhost:8094/trip/1")!
        let request = URL(string: "http://localhost:8094/user/1/trips")!
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
//                    self.responseData = responseString
                completion(responseString)
            } else {
                completion("")
            }
            
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response \(response!)")
                return
            }


        }.resume()
        
//        print("SADSAD \(responseData)")
//            return responseData
            
//            return load(returnData!)

        }
        
        func load<T: Decodable>(_ data: Data) -> T {
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse data as \(T.self):\n\(error)")
            }
        }
    
    
    
}
