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
        guard let url = URL(string: "\(Contrants.baseURL)/3/trending/movie/day?api_key=\(Contrants.API_KEY)") else {return}
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
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/trending/tv/day?api_key=\(Contrants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrandingTvResponse.self, from: data)
                print(results)
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    func getupcpmongMovie(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/upcoming?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingMovieresponse.self, from: data)
                print(results)
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    func getPopularMovie(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/popular?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingMovieresponse.self, from: data)
                print(results)
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    func getTopratedMovie(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/top_rated?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingMovieresponse.self, from: data)
                print(results)
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
    
}


