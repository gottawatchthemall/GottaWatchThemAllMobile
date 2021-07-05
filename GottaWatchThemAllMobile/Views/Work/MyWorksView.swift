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
        imageLoader = ImageLoader(urlString: work.poster)
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
                    Text(work.title)
                    Spacer()
                }
                HStack {
                    Text(work.type)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct MyWorksView: View {
    var works: [Work] = []
    
    init() {
        works.append(Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
        
        works.append(Work(id: 2, title: "Star wars", year: "2020", type: "PIOU PIOU!", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
        
        works.append(Work(id: 3, title: "Indiana Jones", year: "2020", type: "Pas le dernier", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
        
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
        WorkRow(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
    }
}
