//
//  MyWorksView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

struct WorkRow: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var work: Work
    
    init(work: Work) {
        self.work = work
        if let poster = work.poster {
            imageLoader = ImageLoader(urlString: poster)
        } else {
            imageLoader = ImageLoader(urlString: "")
        }
        
    }
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:50, height:50)
                            .onReceive(imageLoader.didChange) { data in
                            self.image = UIImage(data: data) ?? UIImage()
                            }
            VStack {
                HStack {
                    Text(work.title ?? "")
                    Spacer()
                }
                HStack {
                    Text(work.type ?? "")
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct MyWorksView: View {
    
    @State var works: [Work] = []
    
    var body: some View {
        
        NavigationView {
            WorksView(title: "Watched Works", isMine: true)
        }
    
    }
}

struct WorksView: View {
    
    var title: String
    var user: UserResponse?
    var displayBack = false;
    var isMine: Bool;
    
    @State var works: [Work] = []
    
    func loadMyWatchedWorks() {
        if user == nil {
            WorkService().findMyWatchedWorks() { watchedWorks in
                if let newWorks = watchedWorks {
                    works = newWorks
                }
            }
        } else {
            if let userId = user?.id {
                WorkService().findUserWatchedWorks(userId: userId) { watchedWorks in
                    if let newWorks = watchedWorks {
                        works = newWorks
                    }
                }
            } else {
                //TODO display erreur
            }
            
        }
    }
    
    var body: some View {
        VStack {
            if(displayBack == false) {
                TitleView(title: title)
            }
            
            List(works) { work in
                NavigationLink(
                    destination: WorkDetailsView(work: work, canDelete: isMine)) {
                    WorkRow(work: work)
                }
            }.onAppear() {
                loadMyWatchedWorks()
            }
        }.navigationBarTitle(displayBack ? title : "")
        .navigationBarHidden(!displayBack)
        .onAppear() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 32)!]
        }
    }
    
}

struct MyWorksView_Previews: PreviewProvider {
    static var previews: some View {
        MyWorksView()
        WorkRow(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
    }
}
