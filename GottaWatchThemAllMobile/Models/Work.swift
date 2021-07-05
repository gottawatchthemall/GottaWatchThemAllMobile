//
//  Work.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import Foundation
import SwiftUI

struct Work: Identifiable, Hashable {
    let id: Int
    let title: String
    let year: String
    let type: String
    let poster: String
    let plot: String? = nil
    let duration: Int? = nil
    let directors: String? = nil
    let writers: String? = nil
    let actors: String? = nil
    
    var image: Image {
        Image(poster)
    }
    
    func getDuration() -> String {
        if duration != nil {
            return "\(String(describing: duration))"
        }
        return "N/A"
    }
    
    
}
