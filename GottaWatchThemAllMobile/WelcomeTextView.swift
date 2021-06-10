//
//  WelcomeTextView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct WelcomeTextView: View {
    var body: some View {
        return Text("Gotta watch them all")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
    }
}

struct WelcomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTextView()
    }
}
