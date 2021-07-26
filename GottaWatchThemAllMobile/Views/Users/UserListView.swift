//
//  UserListView.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 14/07/2021.
//

import SwiftUI

struct SearchUserRow: View {
    
    var user: UserResponse
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                .frame(width:35, height:35)
                .padding(.leading, 10.0)
                            
            VStack {
                HStack {
                    Text(user.name ?? "").fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text(user.email ?? "")
                    Spacer()
                }
            }
            if(user.vulgar ?? false) {
                Image(systemName: "exclamationmark.circle.fill").resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width:35, height:35)
                    .foregroundColor(.red)
            }
            

            Spacer()
        }
    }
}


struct UserListView: View {
    
    @State var users: [UserResponse] = []
    @State var showCancelButton = false
    @State var searchText = ""
    @Binding var isLoading: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Search Users")
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        //requete à appeler ici
//                        users.append(UserResponse(id: 0, name: "jamso", email: "jam@mail.fr", vulgar: true))
//                        users.append(UserResponse(id: 1, name: "Masa", email: "msa@mail.fr", vulgar: false))
//                        users.append(UserResponse(id: 2, name: "Jerem", email: "terter@mail.fr", vulgar: false))
//                        users.append(UserResponse(id: 0, name: "popo", email: "lucapopo@mail.fr", vulgar: true))
                        findUsersByTitle(title: searchText)
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                            self.users = []
                        
                    }
                    .foregroundColor(Color(.systemBlue))
                }
                
                List (self.users) { user in
                    NavigationLink(
                        destination: WorksView(title: "User Works", user: user, displayBack: true, isMine: false, isLoading: $isLoading)) {
                            SearchUserRow(user: user)
                        }
                }
                .navigationBarTitle("")
                .resignKeyboardOnDragGesture()
                
                Spacer()
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    func findUsersByTitle(title: String) {
        isLoading = true
        UserService().searchUsersByTitle(title: title) { response in
            isLoading = false
            if let allUsers = response {
                self.users = allUsers
            }
        }
    }

    
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(isLoading: .constant(false))
        SearchUserRow(user: UserResponse(id: 0, name: "popo", email: "lucapopo@mail.fr", vulgar: false))
    }
}
