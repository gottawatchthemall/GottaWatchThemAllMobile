//
//  InputView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct InputView: View {
    
    var inputTitle : String
    @Binding var inputValue: String
    
    var body: some View {
        TextField(inputTitle, text: $inputValue)
    }
}

//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView(inputTitle: "Username", inputValue: "")
//    }
//}
