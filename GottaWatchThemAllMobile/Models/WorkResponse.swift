//
//  WorkResponse.swift
//  GottaWatchThemAllMobile
//
//  Created by Jérémy TERNISIEN on 08/07/2021.
//

import Foundation

struct WorkResponse: Identifiable, Hashable, Decodable {
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
    let duration: Int?
    let directors: String?
    let writers: String?
    let actors: String?
    let media: Media?
    let comments: [Comment]?    
}
