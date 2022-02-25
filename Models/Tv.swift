//
//  Tv.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/02/25.
//

import Foundation

struct TrandingTvResponse: Codable {
    let results: [Tv]
}
struct Tv: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
