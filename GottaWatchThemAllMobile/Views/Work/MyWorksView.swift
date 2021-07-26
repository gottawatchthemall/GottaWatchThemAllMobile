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
    var displayBack = false
    var isMine: Bool
    @EnvironmentObject var settings: Settings
    @State var works: [Work] = []
    @State var myWorks: [Work] = []
    
    func loadMyWatchedWorks() {
        settings.isLoading = true
        if user == nil {
            WorkService().findMyWatchedWorks() { watchedWorks in
                settings.isLoading = false
                if let newWorks = watchedWorks {
                    works = newWorks
                }
            }
        } else {
            
            if let userId = user?.id {
                WorkService().findUserWatchedWorks(userId: userId) { watchedWorks in
                    settings.isLoading = false
                    if let newWorks = watchedWorks {
                        works = newWorks
                    }
                }
                WorkService().findMyWatchedWorks() { watchedWorks in
                    settings.isLoading = false
                    if let newWorks = watchedWorks {
                        myWorks = newWorks
                    }
                }
            } else {
                settings.isLoading = false
                //TODO display erreur
            }
        }
    }
    
    func notAlreadyHaveWork(work: Work) -> Bool {
        return user != nil && myWorks.first(where: { $0.imdbId == work.imdbId }) == nil
    }
    
    var body: some View {
        VStack {
            if(displayBack == false) {
                TitleView(title: title)
            }
            
            List(works) { work in //comment je sais si j'ai le work ou pas ?
                NavigationLink(
                    destination: WorkDetailsView(work: work, canDelete: isMine, canAdd: notAlreadyHaveWork(work: work))) {
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
