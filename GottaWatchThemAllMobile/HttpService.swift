//
//  HttpService.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 28/06/2021.
//

import Foundation

class MyHttpService {
    
    static let serverUrl: String = "http://localhost:8080/api"
    
    static func get <T: Decodable>(path: String, callback: @escaping (_ data: T?) -> Void) {
        guard let url = URL(string: "\(serverUrl)\(path)") else {
            callback(nil)
            return
        }
        
        let request = URLRequest(url: url)
        //request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                callback(nil)
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    callback(decodedResponse)
                }
            } else {
                callback(nil)
            }
            
        }.resume()
    }
    
    static func post <T: Decodable, R: Codable>(path: String, body: R, requestType: R.Type,
                                                responseType: T.Type, callback: @escaping (_ data: T?) -> Void) {
        guard let url = URL(string: "\(serverUrl)\(path)") else {
           callback(nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let bodyToSend = try? JSONEncoder().encode(body)
        request.httpBody = bodyToSend
        //request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                callback(nil)
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    callback(decodedResponse)
                }
            } else {
                callback(nil)
            }
            
        }.resume()
    }
    
    //    static func get(path: String) -> Void {
    //        let url = URL(string: path)
    //        var request = URLRequest(url: url!)
    //        request.httpMethod = "GET"
    //
    //        let session = URLSession.shared
    //        let task = session.dataTask(with: request) { (data, response, error) in
    //
    //            if error != nil {
    //                // Handle HTTP request error
    //                print("error")
    //            } else if data != nil {
    //                print("ca fonctionne")
    //                // Handle HTTP request response
    //            } else {
    //                // Handle unexpected error
    //            }
    //        }
    //
    //        task.resume()
    //
    //    }
    
}
