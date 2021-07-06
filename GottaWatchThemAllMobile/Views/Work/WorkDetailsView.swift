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
    
    @State var displayWarning = false
    
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
                        Text("Commentaire").appButton(buttonWidth: 150, buttonHeight: 60, buttonColor: Color.orange)
                            }
                        .padding(.bottom, 11.0)
                    
                    SimpleButtonView(buttonTitle: "Supprimer", buttonColor: Color.red, buttonWidth: 150, action: { self.displayWarning.toggle()})
                        .padding(.bottom, 11.0)
                        .actionSheet(isPresented: $displayWarning) {
                            ActionSheet(title: Text("Suppression"), message: Text("Etes-vous sur de supprimer l'oeuvre de votre liste ?"),
                                        buttons: [.destructive(Text("Supprimer"), action: {print("salut")}),
                                                  .default(Text("Annuler"), action: {print("Supression")})])
                        }
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
