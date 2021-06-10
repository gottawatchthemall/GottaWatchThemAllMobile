//
//  LogButtonView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct LogButtonView: View {
    var buttonTitle : String
    
    var body: some View {
        return Text(buttonTitle)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color("ButtonColor"))
                .cornerRadius(15.0)
        }
}

struct LogButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogButtonView(buttonTitle: "Valider")
    }
}
