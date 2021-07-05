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
                MyHttpService.get(path: "https://mocki.io/v1/f0e85b8e-f9c7-42a4-80e8-e3abf668feb3")

                
            }) {
                SimpleButtonView(buttonTitle: "Validate", buttonColor: Color("BlackPokeball"))
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
