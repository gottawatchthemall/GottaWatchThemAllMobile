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
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if(isLog) {
                    HomeView()
                } else {
                    MainLogView(isLog: $isLog)
                }
                LoaderView(isLoading: settings.isLoading)
            }.environmentObject(settings)
            
            
        }
    }
}
