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
        NavigationStack() {
            VStack(content: {
                Spacer()

                Image(systemName: "lock.shield")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()

                Text("WildTour").font(.title)

                Spacer()

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
                }) {
                    Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(!username.isEmpty && !password.isEmpty ? Color.blue : Color.gray)
                            .disabled(username.isEmpty && password.isEmpty)
                            .cornerRadius(8)
                }
                        .padding(.top, 50)

                NavigationLink("", destination: Text("isLoginSuccessful \(isLoginSuccessful ? "true" : "false")"))
                        .navigationDestination(isPresented: $isLoginSuccessful) {
                            ContentView().navigationBarBackButtonHidden(true)
                        }

                Spacer()
            })
                    .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

