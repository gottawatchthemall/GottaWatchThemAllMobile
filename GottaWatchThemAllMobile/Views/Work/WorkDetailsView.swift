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
    @State var canDelete: Bool
    var work: Work
    @State var canAdd: Bool
    @State var displayWarning = false
    
    init(work: Work, canDelete: Bool, canAdd: Bool) {
        self.work = work
        self.canDelete = canDelete
        self.canAdd = canAdd
        if let poster = work.poster {
            imageLoader = ImageLoader(urlString: poster)
        } else {
            imageLoader = ImageLoader(urlString: "")
        }
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 32)!]

    }
    
    func addWork(imdbId: String) {
        UserService().addWatchedWork(imdbId: imdbId) { response in
            //faire apparaître un pop up de validation
            canAdd = false
            canDelete = true
            print("Work ajouté !")
        }
    }
    
    func removeWork(workId: Int) {
        UserService().removeWatchedWork(workId: workId) { response in
            //faire apparaître un pop up de validation
            if(response == true) {
                canAdd = true
                canDelete = false
                print("Work supprimé !")
            }
        }
    }
    
    var body: some View {
        
            VStack {
                Text("durée : \(work.duration ?? "N/A")" )
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
                   
                    if(canDelete) {
                        SimpleButtonView(buttonTitle: "Supprimer", buttonColor: Color.red, buttonWidth: 150, action: { self.displayWarning.toggle()})
                            .padding(.bottom, 11.0)
                            .actionSheet(isPresented: $displayWarning) {
                                ActionSheet(title: Text("Suppression"), message: Text("Etes-vous sur de supprimer l'oeuvre de votre liste ?"),
                                            buttons: [.destructive(Text("Supprimer"), action: {
                                                if let workId = work.id {
                                                    removeWork(workId: workId)
                                                }
                                            }),
                                                      .default(Text("Annuler"), action: {print("Supression")})])
                            }
                    }
                    
                    if(canAdd) {
                        SimpleButtonView(buttonTitle: "Ajouter", buttonColor: Color.red, buttonWidth: 150) {
                            if let imdbId = work.imdbId {
                                addWork(imdbId: imdbId)
                            }
                        }.padding(.bottom, 11.0)
                    }
                }
            }
            .navigationBarTitle(Text(work.title ?? ""))
            
    }
}

struct WorkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailsView(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"link"), canDelete: true, canAdd: true)
    }
}
