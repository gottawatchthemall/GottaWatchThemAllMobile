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
    @Binding var isLoading: Bool
    
    
    var body: some View {
        VStack {
            TitleView(title: "Create new account")
            Spacer()
            InputFieldView(name: "Email", value: $email)
            InputFieldView(name: "Username", value: $username)
            PasswordFieldView(value: $password)
            Spacer()
            SimpleButtonView(buttonTitle: "Validate", buttonColor: Color("BlackPokeball")) {
                isLoading = true
                let userAuth = UserAuth(username: username, email: email, password: password)
                
                AuthService().register(userAuth: userAuth) { response in
                    isLoading = false
                    if(response != nil) {
                        isRegisterActive = false;
                    } else {
                        //afficher une erreur
                        print("Erreur lors du register")
                    }
                    
                }
            }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegisterActive: .constant(true), isLoading: .constant(false))
    }
}
