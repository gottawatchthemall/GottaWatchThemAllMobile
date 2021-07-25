//
//  ChooseActionView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack {
            Spacer()
            
            TabView {
                MyWorksView()
                    .tabItem {
                        Text("Watched")
                        Image(systemName: "tv")
                    }
                
                SearchWorkView()
                    .tabItem {
                        Text("Works")
                        Image(systemName: "magnifyingglass")
                    }
                
                UserListView()
                    .tabItem {
                        Text("Users")
                        Image(systemName: "person.crop.rectangle")
                    }
                
            }.onAppear() {
                UITabBar.appearance().barTintColor = .clear
            }
            .accentColor(.red)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
