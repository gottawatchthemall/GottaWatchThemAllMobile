//
//  InputFieldView.swift
//  
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct InputFieldView: View {
    
    let name : String
    @Binding var value: String
    
    var body: some View {
        return TextField(name, text: $value)
            .padding()
            .background(Color("WhitePokeball"))
            .cornerRadius(5.0)
            .padding(20)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(name: "input name", value: .constant("valeur"))
    }
}
