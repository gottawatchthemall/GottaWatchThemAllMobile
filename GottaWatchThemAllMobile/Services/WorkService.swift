//
//  WorkService.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 08/07/2021.
//

import Foundation

class WorkService {
    
    func findMyWatchedWorks(callback: @escaping (_ response: [Work]?) -> Void) -> Void {
        MyHttpService.get(path: "/watched/works", responseType: [Work].self) { response in
            callback(response)
        }
    }
    
    func searchWorkByTitle(title: String, callback: @escaping (_ response: [Work]?) -> Void) -> Void {
        MyHttpService.get(path: "/works/moviedb/\(title)", responseType: [Work].self) { response in
            callback(response)
        }
    }
    
}
