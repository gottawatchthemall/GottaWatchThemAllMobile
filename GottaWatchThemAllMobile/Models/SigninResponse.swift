//
//  SigninResponse.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 08/07/2021.
//

import Foundation

struct SigninResponse: Decodable {
    let token: String
    let id: Int
    let username: String
    let email: String    
}
