//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct SimpleButtonView: View {
    var buttonTitle : String
    var buttonColor: Color
    
    var body: some View {
        return Text(buttonTitle)
                .font(.headline)
                .foregroundColor(.white)
                //.padding()
                .frame(width: 220, height: 60)
                .background(buttonColor)
                .cornerRadius(15.0)
        }
}

struct SimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButtonView(buttonTitle: "Valider", buttonColor: Color("RedPokeball"))
    }
}
