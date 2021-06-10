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
                        Text("My works")
                        Image(systemName: "photo.fill.on.rectangle.fill")
                    }
                
                SearchWorkView()
                    .tabItem {
                        Text("Search a work")
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                
                SearchUserView()
                    .tabItem {
                        Text("Search a user")
                        Image(systemName: "person.crop.rectangle.fill")
                    }
                
            }.onAppear() {
                UITabBar.appearance().barTintColor = .white
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
