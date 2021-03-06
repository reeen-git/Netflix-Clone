//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/03/01.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}
struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
