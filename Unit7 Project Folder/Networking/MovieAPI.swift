//
//  MovieAPI.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

final class MovieAPI {
    private static let downloader = JSONDownloader()
    
    class func downloadPeople(completion: @escaping (Result<[NameData], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/person/popular?api_key=0045d9aae6eff2fb645130137e72e2ad&language=en-US&page=1%2C2") else { return }
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.movieDecoder.decode(NameResultsData.self, from: data)
                    let people = result.results
                    completion(.success(people))
                    print(people)
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    class func downloadMovies(completion: @escaping (Result<[MovieData], Error>) -> Void) {
        for URLPicker in arrayOfURLSOne {
            guard let url = URL(string: URLPicker) else { return }
        downloader.jsonTask(with: url) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let data):
                do {
                    let result = try JSONDecoder.movieDecoder.decode(MovieResultsData.self, from: data)
                    let movies = result.results
                    completion(.success(movies))
                    print("Got Movies")
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
        }
        for URLPicker in arrayOfURLSTwo {
            guard let url = URL(string: URLPicker) else { return }
            downloader.jsonTask(with: url) { result in
                switch result {
                case .failure(let error): completion(.failure(error))
                case .success(let data):
                    do {
                        let result = try JSONDecoder.movieDecoder.decode(MovieResultsData.self, from: data)
                        let movies = result.results
                        completion(.success(movies))
                        print("Got Movies")
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
        
    }
}
