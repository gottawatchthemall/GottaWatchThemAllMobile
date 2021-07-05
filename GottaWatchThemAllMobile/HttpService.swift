//
//  HttpService.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 28/06/2021.
//

import Foundation

class MyHttpService {
    
    static func get(path: String) -> Void {
        let url = URL(string: path)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if error != nil {
                // Handle HTTP request error
                print("error")
            } else if data != nil {
                print("ca fonctionne")
                // Handle HTTP request response
            } else {
                // Handle unexpected error
            }
        }
        
        task.resume()

    }
    
}
