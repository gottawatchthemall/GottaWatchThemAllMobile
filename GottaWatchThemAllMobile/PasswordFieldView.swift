//
//  PasswordField.swift
//  
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct PasswordFieldView: View {
    
    @Binding var value: String
    
    var body: some View {
        return SecureField("Password", text: $value)
            .padding()
            .background(Color("InputColor"))
            .cornerRadius(5.0)
            .padding(20)
    }
}

struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(value: .constant("Pass"))
    }
}
