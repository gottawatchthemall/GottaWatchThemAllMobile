//
//  CommentRow.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 05/07/2021.
//

import SwiftUI

struct CommentRow: View {
    
    var comment: Comment
    
    var body: some View {
        if comment.vulgar == true {
            BannedComment(comment: comment)
        } else {
            RegularComment(comment: comment)
        }
    }
}

struct RegularComment: View{
    
    var comment: Comment
    
    var body: some View {
        VStack {
            HStack {
                Text("\(comment.userId)").underline()
                Spacer()
                Text(Date(), style: .date)
                
            }
            HStack {
                Text(comment.content)
                Spacer()
            }
        }
    }
}

struct BannedComment: View{
    
    var comment: Comment
    
    var body: some View {
        VStack {
            HStack {
                Text("\(comment.userId) banned").italic()
                Spacer()
                Text(comment.publishAt, style: .date).italic()
            }
            HStack {
                Text("Commentaire supprimé").foregroundColor(.red)
                Spacer()
            }
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment:
                    Comment(id: 1, content: "Test de commentaire", vulgar: false, userId: 5, workId: 8, publishAt: Date()))
    }
}
