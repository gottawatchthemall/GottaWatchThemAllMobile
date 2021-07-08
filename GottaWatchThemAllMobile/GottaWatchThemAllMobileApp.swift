//
//  GottaWatchThemAllMobileApp.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 07/06/2021.
//

import SwiftUI

@main
struct GottaWatchThemAllMobileApp: App {
    
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
