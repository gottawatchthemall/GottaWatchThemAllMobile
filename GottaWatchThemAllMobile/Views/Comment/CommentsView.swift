//
//  CommentsView.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 05/07/2021.
//

import SwiftUI

struct CommentsView: View {
    var work: Work
    var comments: [Comment] = []
    
    init(work: Work) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 32)!]
        self.work = work
        comments.append(Comment(id: 1, content: "Test de commentaire", vulgar: false, userId: 5, workId: 8, publishAt: Date()))
        comments.append(Comment(id: 2, content: "Commentaire ban", vulgar: true, userId: 6, workId: 8, publishAt: Date()))
        comments.append(Comment(id: 3, content: "Vraiment bien le film", vulgar: false, userId: 8, workId: 8, publishAt: Date()))
    }
    
    var body: some View {
        VStack {
            List(comments) { comment in
                CommentRow(comment: comment).padding(.bottom, 5)
                }
            }.navigationBarTitle("Commentaires")
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(work: Work(id: 1, title: "Pirate des c", year: "2020", type: "Piraterie", poster:"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"))
    }
}
