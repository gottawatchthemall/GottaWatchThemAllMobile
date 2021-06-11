//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import SwiftUI

struct LogButtonView: View {
    
    var fontName: String
    var buttonColor: Color
    var textColor: Color
    var buttonTitle: String
    
    var body: some View {
        return Text(buttonTitle)
                .font(.custom(fontName, size: 33))
                .padding()
                .frame(width: 220, height: 60)
                .background(buttonColor)
                .cornerRadius(15.0)
                .foregroundColor(textColor)
    }
}

struct LogButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogButtonView(fontName: "PokemonSolidNormal", buttonColor: Color("RedPokeball"), textColor: .white, buttonTitle: "Sign in")
    }
}
