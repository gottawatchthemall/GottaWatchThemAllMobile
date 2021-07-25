//
//  LoaderView.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 09/07/2021.
//

import SwiftUI

struct LoaderView: View {
    
    var isLoading: Bool
    
    var body: some View {
        if(isLoading) {
            Color(.gray).ignoresSafeArea().opacity(0.8)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                VStack {
                    Text("Chargement en cours").padding(5).foregroundColor(Color.black)
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                        .scaleEffect(2)
                }
            }).frame(width: 220, height: 100)
            .background(Color("RedPokeball"))
            .cornerRadius(15.0)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isLoading: true)
    }
}
