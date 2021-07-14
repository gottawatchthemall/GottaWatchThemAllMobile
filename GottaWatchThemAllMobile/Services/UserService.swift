//
//  UserService.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 09/07/2021.
//

import Foundation

class UserService {

    func addWatchedWork(imdbId: String, callback: @escaping (_ response: Work?) -> Void) -> Void {
        MyHttpService.put(path: "/watched/works/\(imdbId)", body: "", requestType: String.self, responseType: Work.self) { response in
                callback(response)
            }
    }
    
    func searchUsersByTitle(title: String, callback: @escaping (_ response: [UserResponse]?) -> Void) -> Void {
        MyHttpService.get(path: "/user/search/name/\(title)", responseType: [UserResponse].self) { response in
            callback(response)
        }
    }
    
}
