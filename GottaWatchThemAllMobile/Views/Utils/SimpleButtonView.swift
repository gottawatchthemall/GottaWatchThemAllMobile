//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct SimpleButtonView: View {
    let buttonTitle : String
    let buttonColor: Color
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    
    init(buttonTitle: String, buttonColor: Color, buttonWidth: CGFloat = 220, buttonHeight: CGFloat = 60) {
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
    }
    
    
    var body: some View {
        return Text(buttonTitle)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: buttonWidth, height: buttonHeight)
                .background(buttonColor)
                .cornerRadius(15.0)
        }
}

struct SimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButtonView(buttonTitle: "Valider", buttonColor: Color("RedPokeball"))
    }
}
