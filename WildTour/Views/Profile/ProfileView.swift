import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var network: UserData

    @State private var showProfileEditor = false
    @State private var isLogoutSuccessful = false
    @State private var isCreateNewPressed = false
    @State private var showFavoritesOnly = false


    var body: some View {
        NavigationStack {
            ProfileSummary(profile: network.profile!).padding()
                    .navigationTitle("Profile")
                    .toolbar {
                        Button {
                            showProfileEditor.toggle()
                        } label: {
                            Text("edit")
                        }
                    }
                    .sheet(isPresented: $showProfileEditor) {
                        ProfileEditor(profile: network.profile!, host: network.baseUrl)
                                .environment(\.showProfileEditor, self.$showProfileEditor)
                                .environment(\.isLogoutSuccessful, self.$isLogoutSuccessful)
                    }

            NavigationLink("", destination: EmptyView())
                    .navigationDestination(isPresented: $isLogoutSuccessful) {
                        ContentView()
                                .navigationBarBackButtonHidden(true)

                    }
        }
                .onAppear {
                    network.getUser()
                }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(MockData())
    }
}
