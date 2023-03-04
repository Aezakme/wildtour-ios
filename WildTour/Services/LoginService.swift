//
//  LoginService.swift
//  WildTour
//
//  Created by Kirill Polyakov on 05.03.2023.
//

import Foundation


class LoginService {
    
    static func login(username: String, password: String) -> OSStatus {
        if (username == "" || password == "") {return errSecInvalidData}
        
        let status = KeychainService.saveValue(key : "username", value : username)
        if (status != errSecSuccess) {return status}
        
        return KeychainService.saveValue(key : "password", value : password)
    }
    
    static func getUsername() -> String? {
        return KeychainService.getByKey(key: "username")
    }
    
    static func getPassword() -> String? {
        return KeychainService.getByKey(key: "password")
    }
    
    static func logout() {
        var status = KeychainService.deleteValue(key : "username")
        if (status != errSecSuccess) {print("problem with logout \(status)")}
        
        //if (status != errSecSuccess) {print("problem with logout 2 \(status)")} //WTF???
    }
    
    static func isLoggined() -> Bool {
        return KeychainService.getByKey(key: "username") != nil && KeychainService.getByKey(key: "username") != ""
        && KeychainService.getByKey(key: "password") != nil && KeychainService.getByKey(key: "password") != ""
    }
    
}
