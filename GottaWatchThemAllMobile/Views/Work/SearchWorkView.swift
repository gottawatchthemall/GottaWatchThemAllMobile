//
//  SearchWorkView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 10/06/2021.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

struct SearchWorkRow: View {
    @ObservedObject var imageLoader:ImageLoader = ImageLoader(urlString: "")
    @State var image:UIImage = UIImage()
    var work: Work
    @State var myWorks: [Work] = []
    
    func containWork() -> Bool {
        return myWorks.first(where: { $0.imdbId == work.imdbId }) != nil
    }
    
    init(work: Work, myWorks: [Work]) {
        self.work = work
        self.myWorks = myWorks
        
        if let poster = work.poster {
            imageLoader = ImageLoader(urlString: poster)
        } else {
            imageLoader = ImageLoader(urlString: "")
        }
    }
    
    func removeWork(workId: Int) {
        UserService().removeWatchedWork(workId: workId) { response in
            //faire apparaître un pop up de validation
            if(response == true) {
                if let workIndex = myWorks.firstIndex(where: {$0.id == workId}) {
                    myWorks.remove(at: workIndex)
                }
            }
        }
    }
    
    func addWork(imdbId: String) {
        UserService().addWatchedWork(imdbId: imdbId) { response in
            print(response) // should be the work added
            //doit faire disparaitre le bouton +
            if let newWork = response {
                myWorks.append(newWork)
            }
            
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
            
            if(containWork() == false) {
                Button {
                    print("CLiqué sur ajouter")
                    //ici faire la requête
                    if let imdbId = work.imdbId {
                        addWork(imdbId: imdbId)
                    }
                    
                } label: {
                    Image(systemName: "plus.square.fill")
                }
            } else {
                Button {
                    print("CLiqué sur supprimer")
                    //ici faire la requête de suppression
                    if let workId = myWorks.first(where: {$0.imdbId == work.imdbId})?.id {
                        removeWork(workId: workId)
                    }
                    
                } label: {
                    Image(systemName: "minus.square.fill")
                }
            }
            

            Spacer()
        }
    }
}

struct SearchWorkView: View {
    @State var works: [Work] = []
    @State var showCancelButton = false
    @State var searchText = ""
    @State var myWorks: [Work] = []
    @EnvironmentObject var settings: Settings
    
    
    func loadMyWatchedWorks() {
        settings.isLoading = true
        WorkService().findMyWatchedWorks() { watchedWorks in
            settings.isLoading = false
//            print("je suis passé dans find my work")
//            print(watchedWorks)
            if let newWorks = watchedWorks {
                self.myWorks = newWorks
            }
        }
    }
    
    func findWorksByTitle(title: String) {
        settings.isLoading = true
        WorkService().searchWorkByTitle(title: title) { response in
            settings.isLoading = false
            if let allWorks = response {
                self.works = allWorks
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Search works")
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                        loadMyWatchedWorks()
                        //requete à appeler ici
                        findWorksByTitle(title: searchText)
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                            self.works = []
                        
                    }
                    .foregroundColor(Color(.systemBlue))
                }
                
                List (self.works, id: \.imdbId) { work in
                    //ForEach(works.filter{($0.title ?? "").hasPrefix(searchText) || searchText == ""}, id:\.self) {
                    SearchWorkRow(work: work, myWorks: myWorks)
                    //}
                }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
                
                Spacer()
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct SearchWorkView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWorkView()
    }
}
