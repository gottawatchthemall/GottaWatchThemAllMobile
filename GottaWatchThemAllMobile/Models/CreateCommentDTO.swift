//
//  CreateCommentDTO.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 26/07/2021.
//

import Foundation

struct CreateCommentDTO: Hashable, Codable {
    let content: String?
    let workId: Int?
}
