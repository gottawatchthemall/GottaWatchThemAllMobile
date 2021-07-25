//
//  LoginView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @Binding var isLog: Bool
    @Binding var isLoading: Bool
    
    var body: some View {
            VStack {
                TitleView(title: "Log in")
                
                Spacer()
                InputFieldView(name: "Username", value: $username)
                PasswordFieldView(value: $password)
                Spacer()
                SimpleButtonView(buttonTitle: "Validate", buttonColor: Color("RedPokeball")) {
                    isLoading = true
                    print("jai cliquéfrr")
                    let defaults = UserDefaults.standard
                    let userAuth = UserAuth(username: username, email: nil, password: password)
                    AuthService().login(userAuth: userAuth) { response in
                        isLoading = false
                        if(response != nil) {
                            defaults.setValue(response?.token, forKey: "jwt")
                            isLog = true
                        }
                    }
                }.disabled(isLoading)
                
                Spacer()
            }
        }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLog: .constant(false), isLoading: .constant(false))
    }
}
