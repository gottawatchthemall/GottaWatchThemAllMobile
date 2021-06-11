//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import SwiftUI

struct LogButtonView: View {
    
    let fontName: String
    let buttonColor: Color
    let textColor: Color
    let buttonTitle: String
    
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
