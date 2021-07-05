//
//  WorkDetailsView.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import SwiftUI

struct WorkDetailsView: View {
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var work: Work
    
    init(work: Work) {
        self.work = work
        imageLoader = ImageLoader(urlString: work.poster)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 32)!]

    }
    
    var body: some View {
        
            VStack {
                Text("durée : \(work.getDuration())" )
                Spacer()
                HStack {
                    Text("Réalisateur :")
                    Text("\(work.directors ?? "N/A")")
                    Spacer()
                }
                HStack {
                    Text("Scénario :")
                    Text("\(work.writers ?? "N/A")")
                    Spacer()
                }
                HStack {
                    Text("Acteurs :")
                    Text("\(work.actors ?? "N/A")")
                    Spacer()
                }
                HStack {
                    Text("Résumé")
                    Spacer()
                }
                ScrollView {
                    Text("\(work.plot ?? "N/A")")
                }.frame(width: 350, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                
                Spacer()
                HStack {
                    NavigationLink(
                        destination: CommentsView(work: work)) {
                            SimpleButtonView(buttonTitle: "Commentaire", buttonColor: Color.orange, buttonWidth: 150)
                            }
                        .padding(.bottom, 11.0)
                    SimpleButtonView(buttonTitle: "Supprimer", buttonColor: Color.red, buttonWidth: 150)
                        .padding(.bottom, 11.0)
                }
            }
            .navigationBarTitle(Text(work.title))
            
    }
}

struct WorkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailsView(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"link"))
    }
}
