//
//  RegisterView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    
    @Binding var isRegisterActive: Bool
    
    var body: some View {
        VStack {
            TitleView(title: "Create new account")
            Spacer()
            InputFieldView(name: "Email", value: $email)
            InputFieldView(name: "Username", value: $username)
            PasswordFieldView(value: $password)
            Spacer()
            Button(action: {
                print("Trying to register !")
                let userAuth = UserAuth(username: username, email: email, password: password)
                MyHttpService.post(path: "/auth/signup", body: userAuth,
                                   requestType: UserAuth.self,
                                   responseType: MessageResponse.self
                ) { response in
                    //navigate to register if succeed
                    isRegisterActive = false;
                    print(response ?? "Error")
                    if(response != nil) {
                        print("Registered !")
                    }
                }
            }) {
                SimpleButtonView(buttonTitle: "Validate", buttonColor: Color("BlackPokeball"))
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegisterActive: .constant(true))
    }
}
