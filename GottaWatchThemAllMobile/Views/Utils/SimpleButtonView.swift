//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI


extension View {

    func appButton(buttonWidth: CGFloat, buttonHeight: CGFloat, buttonColor: Color	) -> some View {
    self.font(.headline)
        .foregroundColor(.white)
        .frame(width: buttonWidth, height: buttonHeight)
        .background(buttonColor)
        .cornerRadius(15.0)
}
}

struct SimpleButtonView: View {
    let buttonTitle : String
    let buttonColor: Color
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    let action: () -> Void
    
    init(buttonTitle: String, buttonColor: Color, buttonWidth: CGFloat = 220, buttonHeight: CGFloat = 60, action: @escaping () -> Void = {} ) {
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.action = action
    }
    
    
    var body: some View {
        return Button(buttonTitle) {
            action()
        }.appButton(buttonWidth: buttonWidth, buttonHeight: buttonHeight, buttonColor: buttonColor)
        }

}

struct SimpleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButtonView(buttonTitle: "Valider", buttonColor: Color("RedPokeball")) {
            print("Salut")
        }
    }
}
