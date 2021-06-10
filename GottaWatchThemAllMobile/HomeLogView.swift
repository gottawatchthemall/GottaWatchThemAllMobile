//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct HomeLogView: View {

    var body: some View {
       
        VStack {
            TitleView(title: "Gotta watch them all")
            
            TabView {
                LoginView()
                    .tabItem {
                        Text("Login")
                        Image(systemName: "person.crop.circle.fill")
                    }
                
                RegisterView()
                    .tabItem {
                        Text("Register")
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                    }
            }.onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
            .accentColor(.red)
        }
        
    }
    
    
    
}


struct HomeLogView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLogView()
    }
}
