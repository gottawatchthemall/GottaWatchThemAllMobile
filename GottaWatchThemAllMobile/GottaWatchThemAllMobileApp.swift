//
//  GottaWatchThemAllMobileApp.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 07/06/2021.
//

import SwiftUI

@main
struct GottaWatchThemAllMobileApp: App {
    
//    init() {
//        print("JWT : \(UserDefaults.standard.string(forKey: "jwt"))")
//        UserDefaults.standard.removeObject(forKey: "jwt")
//        print("JWT : \(UserDefaults.standard.string(forKey: "jwt"))")
//    }
    
    @State var isLog = false
    
    var body: some Scene { 
        WindowGroup {
            
            if(isLog) {
                HomeView()
            } else {
                MainLogView(isLog: $isLog)
            }
            
        }
    }
}
