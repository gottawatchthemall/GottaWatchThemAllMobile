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
    
    var body: some View {
        
        VStack {

            InputFieldView(name: "Username", value: $username)
            PasswordFieldView(value: $password)

            Button(action: {print("Trying to log in !")}) {
                LogButtonView(buttonTitle: "Log in")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
