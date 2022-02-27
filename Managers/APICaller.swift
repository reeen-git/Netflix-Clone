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
    
    func getTrendMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/trending/movie/day?api_key=\(Contrants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/trending/tv/day?api_key=\(Contrants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
            }
        }
        task.resume()
    }
    func getUpcomingMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/upcoming?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopularMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/popular?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
            }
        }
        task.resume()
    }
    
    func getTopratedMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Contrants.baseURL)/3/movie/top_rated?api_key=\(Contrants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
                
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Contrants.baseURL)/3/discover/movie?api_key=\(Contrants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
                
            }
        }
        task.resume()
    }
    
    func search(with query: String , completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Contrants.baseURL)/3/search/movie?api_key=\(Contrants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrandingTitleresponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedtoGetData))
                
            }
        }
        task.resume()
    }
    
}


