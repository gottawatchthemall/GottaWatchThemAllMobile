//
//  CommentService.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 08/07/2021.
//

import Foundation

class CommentService {
    
    
    func getWorkComments(work: Work, callback: @escaping (_ response: [Comment]?) -> Void) -> Void {
        if let workId: Int = work.id {
            MyHttpService.get(path: "/comment/work/\(workId)",
                              responseType: [Comment].self) { response in
                callback(response)
            }
        }
    }
    
    func addComment(content: String, workId: Int, callback: @escaping () -> Void) -> Void {
        let newComment = CreateCommentDTO(content: content, workId: workId)
        MyHttpService.post(path: "/comment", body: newComment, requestType: CreateCommentDTO.self, responseType: Int.self) { response in
            callback()
        }
    }
    
}
