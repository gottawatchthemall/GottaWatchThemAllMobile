//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct MainLogView: View {
    
    var body: some View {
        NavigationView {
            
            VStack {
                LoginView()
                NavigationLink(
                    destination: RegisterView(),
                    label: {
                        SimpleButtonView(buttonTitle: "New account", buttonColor: Color("BlackPokeball"))
                    })
                
            }
        }
    }
}


struct MainLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainLogView()
    }
}
