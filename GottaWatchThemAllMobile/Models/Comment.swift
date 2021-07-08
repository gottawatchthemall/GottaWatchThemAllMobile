//
//  Comment.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 05/07/2021.
//

import Foundation

struct Comment: Identifiable, Hashable, Decodable {
    let id: Int?
    let content: String?
    let vulgar: Bool?
    let userId: Int?
    let workId: Int?
    let publishAt: Date?
    let username: String?
    
    init(id: Int, content: String, vulgar: Bool, userId: Int, workId: Int, publishAt: Date) {
        self.id = id
        self.content = content
        self.vulgar = vulgar
        self.userId = userId
        self.workId = workId
        self.publishAt = publishAt
        self.username = ""
    }
}
