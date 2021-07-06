//
//  Work.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import Foundation
import SwiftUI

struct Work: Identifiable, Hashable, Decodable {
    let id: Int
    let title: String
    let year: String
    let type: String
    let poster: String
    let plot: String?
    let duration: Int?
    let directors: String?
    let writers: String?
    let actors: String?
    
    var image: Image {
        Image(poster)
    }
    
    func getDuration() -> String {
        if duration != nil {
            return "\(String(describing: duration))"
        }
        return "N/A"
    }
    
    init(id: Int,
    title: String,
     year: String,
     type: String,
     poster: String) {
        self.id = id
        self.title = title
        self.year = year
        self.type = type
        self.poster = poster
        self.plot = nil
        self.duration = nil
        self.directors = nil
        self.writers = nil
        self.actors = nil
    }
    
}
