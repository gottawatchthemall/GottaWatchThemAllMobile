//
//  CommentsView.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 05/07/2021.
//

import SwiftUI

struct CommentsView: View {
    var work: Work
    @State var comments: [Comment] = []
    @State private var newComment: String = ""

    
    init(work: Work) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 32)!]
        self.work = work
//        comments.append(Comment(id: 1, content: "Test de commentaire", vulgar: false, userId: 5, workId: 8, publishAt: Date()))
//        comments.append(Comment(id: 2, content: "Commentaire ban", vulgar: true, userId: 6, workId: 8, publishAt: Date()))
//        comments.append(Comment(id: 3, content: "Vraiment bien le film", vulgar: false, userId: 8, workId: 8, publishAt: Date()))
    }
    
    func addComment(content: String, workId: Int) {
        CommentService().addComment(content: content, workId: workId) {
            newComment = ""
            loadComments()
        }
    }
    
    var body: some View {
        VStack {
            List(comments) { comment in
                CommentRow(comment: comment).padding(.bottom, 5)
            }.onAppear() {
                loadComments()
            }
            HStack {
                Text("Ajouter un commentaire :")
                    .padding(.leading, 8.0)
                Spacer()
            }
            HStack {
                TextEditor(text: $newComment)
                    .foregroundColor(Color.gray)
                    .font(.custom("HelveticaNeue", size: 13))
                    .frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    if let workId = self.work.id {
                        print("CLiqué sur ajouter")
                        addComment(content: newComment, workId: workId)
                    }
                }, label: {
                    Image(systemName: "paperplane.circle.fill").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(newComment.isEmpty ? Color("RedPokeball") : Color("BluePokeball"))
                    
                }).disabled(newComment.isEmpty)
                .padding(.trailing, 25.0)
            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            }.navigationBarTitle("Commentaires")
            
        
    }
    
    func loadComments() {
        CommentService().getWorkComments(work: self.work) { response in
            if let workComments = response {
                self.comments = workComments
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
    }
}
