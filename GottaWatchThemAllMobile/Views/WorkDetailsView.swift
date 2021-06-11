//
//  WorkDetailsView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import SwiftUI

struct WorkDetailsView: View {
    let work: Work
    
    var body: some View {
        VStack {
            Text("En travaux...")
        }.navigationBarTitle(Text(work.title))
    }
}

struct WorkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailsView(work: Work(id: 1, title: "Indiana Jones"))
    }
}
