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
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var work: Work
    @State var myWorks: [Work] = []
    
    func containWork() -> Bool {
        return myWorks.first(where: { $0.imdbId == work.imdbId }) != nil
    }
    
    init(work: Work, myWorks: [Work]) {
        self.work = work
    
        if let poster = work.poster {
            imageLoader = ImageLoader(urlString: poster)
        } else {
            imageLoader = ImageLoader(urlString: "")
        }
        self.myWorks = myWorks
        
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
    
    func removeWork(imdbId: String) {
        //remove le user work
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
                    //ici faire la requête
                    if let imdbId = work.imdbId {
                        addWork(imdbId: imdbId)
                    }
                    
                } label: {
                    Image(systemName: "plus.square.fill")
                }
            } else {
                Button {
                    //ici faire la requête de suppression
                    if let imdbId = work.imdbId {
                        removeWork(imdbId: imdbId)
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
    
    
    func loadMyWatchedWorks() {
        WorkService().findMyWatchedWorks() { watchedWorks in
            if let newWorks = watchedWorks {
                myWorks = newWorks
            }
        }
    }
    
    func findWorksByTitle(title: String) {
        WorkService().searchWorkByTitle(title: title) { response in
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
