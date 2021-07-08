//
//  Work.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 11/06/2021.
//

import Foundation
import SwiftUI

struct Work: Identifiable, Hashable, Decodable {
    let id: Int?
    let imdbId: String?
    let title: String?
    let year: String?
    let releasedDate: String?
    let genres: String?
    let country: String?
    let awards: String?
    let type: String?
    let poster: String?
    let score: Int?
    let plot: String?
    let duration: String?
    let directors: String?
    let writers: String?
    let actors: String?
    let media: Media?
    let comments: [Comment]?
    
    var image: Image? {
        if let newPoster = self.poster {
            return Image(newPoster)
        }
        return nil
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
        self.comments = nil
        self.releasedDate = nil
        self.imdbId = nil
        self.genres = nil
        self.country = nil
        self.awards = nil
        self.score = nil
        self.media = nil
    }
    
}
