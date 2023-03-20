//
//  LoginView.swift
//  WildTour
//
//  Created by Kirill Polyakov on 04.03.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoginSuccessful: Bool = false
    @State var loginButtonTitle: String = "Login"
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "lock.shield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    let status = LoginService.login(username: username, password: password)
                    isLoginSuccessful = status == errSecSuccess
                    loginButtonTitle = isLoginSuccessful ? "Click next" : "Login"
                }) {
                    Text(loginButtonTitle)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                NavigationLink("Next",destination:
                                chooseDestination()
                )
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(8)
                .padding()
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Wildtour")
        .navigationBarBackButtonHidden(true)
        
    }
    
    @ViewBuilder
    func chooseDestination() -> some View {
         ContentView().environmentObject(MockData()).navigationBarBackButtonHidden(true)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        NavigationView {
            LoginView()
        }
    }
}

