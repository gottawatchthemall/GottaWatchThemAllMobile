//
//  Comment.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 05/07/2021.
//

import Foundation

struct Comment: Identifiable {
    let id: Int
    let content: String
    let vulgar: Bool
    let userId: Int
    let workId: Int
    let publishAt: Date
}
