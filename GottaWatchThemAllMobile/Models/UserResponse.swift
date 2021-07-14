//
//  UserResponse.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 14/07/2021.
//

import Foundation

struct UserResponse: Identifiable, Hashable, Decodable {
    let id: Int?
    let name: String?
    let email: String?
    let vulgar: Bool?
}
