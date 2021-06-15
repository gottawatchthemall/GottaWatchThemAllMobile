//
//  MyWorksView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct WorkRow: View {
    var work: Work
    
    var body: some View {
        HStack {
            Text(work.title)
            Spacer()
        }
    }
}

struct MyWorksView: View {
    var works: [Work] = []
    
    init() {
        works.append(Work(id: 1, title: "Pirate des c"))
        
        works.append(Work(id: 2, title: "Star wars"))
        
        works.append(Work(id: 3, title: "Indiana Jones"))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Watched works")
        
                
                List(works) { work in
                    NavigationLink(
                        destination: WorkDetailsView(work: work)) {
                        WorkRow(work: work)
                    }
                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}

struct MyWorksView_Previews: PreviewProvider {
    static var previews: some View {
        MyWorksView()
    }
}
