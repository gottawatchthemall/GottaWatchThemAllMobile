//
//  MainTitleView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct TitleView: View {
    var title: String
    
    var body: some View {
        return Text(title)
            .font(.custom("PokemonSolidNormal", size: 40))
            .padding(.top, 20)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TitleColor"))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Watched works")
    }
}
