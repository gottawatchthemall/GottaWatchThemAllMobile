//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct HomeView: View {
    init() {
        UIFont.familyNames.forEach({name in
            for font_name in UIFont.fontNames(forFamilyName: name) {
                print("\n\(font_name)")
            }
        })
    }
    var body: some View {
       
        VStack {
            Text("Gotta watch them all")
                    .font(.custom("PokemonSolidNormal", size: 40))
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundColor(Color("TitleColor"))
            
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
