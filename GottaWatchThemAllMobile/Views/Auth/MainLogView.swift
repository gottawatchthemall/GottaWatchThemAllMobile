//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct MainLogView: View {
    
    @Binding var isLog: Bool
    @State var isRegisterViewActive = false;
    
    var body: some View {
        NavigationView {
            
            VStack {
                LoginView(isLog: $isLog)
                
                
                NavigationLink(
                    destination: RegisterView(isRegisterActive: $isRegisterViewActive),
                    isActive: $isRegisterViewActive,
                    label: {
                        Text("New account")
                            .appButton(buttonWidth: 220, buttonHeight: 60, buttonColor: Color("BlackPokeball"))
                    })
            }
        }
    }
}


struct MainLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainLogView(isLog: .constant(false))
    }
}
