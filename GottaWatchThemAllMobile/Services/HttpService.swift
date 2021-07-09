//
//  HttpService.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 28/06/2021.
//

import Foundation

class MyHttpService {
    
    static let serverUrl: String = "http://localhost:8080/api"
    
    static func get <T: Decodable>(path: String, responseType: T.Type,  callback: @escaping (_ data: T?) -> Void) {
        guard let url = URL(string: "\(serverUrl)\(path)") else {
            callback(nil)
            return
        }
        let defaults = UserDefaults.standard
        var request = URLRequest(url: url)
        
        
        if let jwt = defaults.string(forKey: "jwt") {
            request.addValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                callback(nil)
                return
            }
            
//            let json = String(data: data, encoding: String.Encoding.utf8)
//            print("Failure Response: \(json)")
//
//
//
//            do {
//                try JSONDecoder().decode(T.self, from: data)
//            } catch let jsonError as NSError {
//                print("JSON decode failed: \(jsonError.localizedDescription)")
//            }
            
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
        let defaults = UserDefaults.standard
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let bodyToSend = try? JSONEncoder().encode(body)
        
        request.httpBody = bodyToSend
        
        if let jwt = defaults.string(forKey: "jwt") {
            request.addValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        }
        
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
    
    static func put <T: Decodable, R: Codable>(path: String, body: R, requestType: R.Type,
                                                responseType: T.Type, callback: @escaping (_ data: T?) -> Void) {
        guard let url = URL(string: "\(serverUrl)\(path)") else {
           callback(nil)
            return
        }
        let defaults = UserDefaults.standard
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PUT"
        let bodyToSend = try? JSONEncoder().encode(body)
        
        request.httpBody = bodyToSend
        
        if let jwt = defaults.string(forKey: "jwt") {
            request.addValue("Bearer \(jwt)", forHTTPHeaderField: "Authorization")
        }
        
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
    
}
