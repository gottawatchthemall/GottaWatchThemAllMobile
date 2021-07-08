//
//  AuthService.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 08/07/2021.
//

import Foundation

class AuthService {
    
    func register(userAuth: UserAuth, callback: @escaping (_ response: MessageResponse?) -> Void) -> Void {
        
        
        MyHttpService.post(path: "/auth/signup", body: userAuth,
                           requestType: UserAuth.self,
                           responseType: MessageResponse.self
        ) { response in
            callback(response)
        }
    }
    
    func login(userAuth: UserAuth, callback: @escaping (_ response: SigninResponse?) -> Void) -> Void {
        
        MyHttpService.post(path: "/auth/signin", body: userAuth,
                           requestType: UserAuth.self,
                           responseType: SigninResponse.self
        ) { response in
            callback(response)
        }
    }
    
//    func signout() -> Void {
//
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "jwt")
//        DispatchQueue.main.async {
//            self.isAuthenticated = false
//        }
//
//    }
    
}
