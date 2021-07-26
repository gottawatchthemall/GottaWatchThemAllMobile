//
//  ChooseActionView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var isLoading = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                TabView {
                    MyWorksView(isLoading: $isLoading)
                        .tabItem {
                            Text("Watched")
                            Image(systemName: "tv")
                        }
                    
                    SearchWorkView(isLoading: $isLoading)
                        .tabItem {
                            Text("Works")
                            Image(systemName: "magnifyingglass")
                        }
                    
                    UserListView(isLoading: $isLoading)
                        .tabItem {
                            Text("Users")
                            Image(systemName: "person.crop.rectangle")
                        }
                    
                }.onAppear() {
                    UITabBar.appearance().barTintColor = .clear
                }
                .accentColor(.red)

            }
            LoaderView(isLoading: isLoading)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
