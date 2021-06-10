//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            LoginView()
                .tabItem {
                    Text("Login")
                }
            
            RegisterView()
                .tabItem {
                    Text("Register")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
