//
//  APICaller.swift
//  NetflixClone
//
//  Created by Huynh Phong on 06/02/2023.
//

import Foundation

struct Constant {
  static let API_KEY = "53470b56a60668274e1dd9f84d882564"
  static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
  case failedTogetData
}

struct APICaller {
  static let shared = APICaller()

  func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    let urlString = "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.API_KEY)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//      completion(.failure(.failedTogetData))
      return
    }
    guard let url = URL(string: encodedString) else {
//      completion(.failure(.failedTogetData))
      return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      guard let safeData = data else { return }
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: safeData)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  func getTrendingTvs(completion: @escaping (Result<[Movie], Error>) -> Void) {
    let urlString = "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//      completion(.failure(.failedTogetData))
      return
    }
    guard let url = URL(string: encodedString) else {
//      completion(.failure(.failedTogetData))
      return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      guard let safeData = data else { return }
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: safeData)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    let urlString = "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//      completion(.failure(.failedTogetData))
      return
    }
    guard let url = URL(string: encodedString) else {
//      completion(.failure(.failedTogetData))
      return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      guard let safeData = data else { return }
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: safeData)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    let urlString = "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//      completion(.failure(.failedTogetData))
      return
    }
    guard let url = URL(string: encodedString) else {
//      completion(.failure(.failedTogetData))
      return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      guard let safeData = data else { return }
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: safeData)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    let urlString = "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
//      completion(.failure(.failedTogetData))
      return
    }
    guard let url = URL(string: encodedString) else {
//      completion(.failure(.failedTogetData))
      return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      guard let safeData = data else { return }
      do {
        let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: safeData)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  
}
