//
//  APICaller.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/02/24.
//

import Foundation

struct Contrants {
    static let API_KEY = "81876567f326e0b4877cef1cd4392baf"
    static let baseURL = "https://api.themoviedb.org"
    
}
enum APIError: Error {
    case failedtoGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/trending/all/day?api_key=\(Contrants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingMovieresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
