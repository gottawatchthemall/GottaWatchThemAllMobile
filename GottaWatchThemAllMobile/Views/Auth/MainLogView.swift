//
//  HomeView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct MainLogView: View {
    
    @Binding var isLog: Bool
    @State var isRegisterViewActive = false
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            NavigationView {
                
                VStack {
                    LoginView(isLog: $isLog, isLoading: $isLoading)
                    
                    
                    NavigationLink(
                        destination: RegisterView(isRegisterActive: $isRegisterViewActive, isLoading: $isLoading),
                        isActive: $isRegisterViewActive,
                        label: {
                            Text("New account")
                                .appButton(buttonWidth: 220, buttonHeight: 60, buttonColor: Color("BlackPokeball"))
                        }).disabled(isLoading)
                }
            }
            
            LoaderView(isLoading: isLoading)
        }
        
    }
}


struct MainLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainLogView(isLog: .constant(false))
    }
}
