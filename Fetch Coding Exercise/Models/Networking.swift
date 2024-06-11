//
//  Networking.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import Foundation
import Combine
import Alamofire

/// Calls TheMealDB's API
struct Networking {
  
  /// Gets the list of meals from TheMealDB API
  ///- Returns: An AnyPublisher that contains either a Meals object, which inside of it will contain an array of [Meal] objects, or an AFError, signaling an error of some sort
  func getMeals() -> AnyPublisher<Meals, AFError> {
    let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    guard let url = URL(string: urlString) else {
      return Fail(error: AFError.invalidURL(url: urlString))
        .eraseToAnyPublisher()
    }
    
    return AF.request(url)
      .validate()
      .publishDecodable(type: Meals.self)
      .value()
  }
  
  /// Gets an individual Dessert from TheMealDB's API given an ID key
  /// - Parameter id: A String containing the numberical 5 digit ID of the Dessert
  /// - Returns: An AnyPublisher that contains either a Dessert object, or an AFError, signaling an error of some sort
  func getDessert(id: String) -> AnyPublisher<Dessert, AFError> {
    let baseURL = "https://themealdb.com/api/json/v1/1/lookup.php?"

    guard var url = URL(string: baseURL) else {
      return Fail(error: AFError.invalidURL(url: baseURL))
        .eraseToAnyPublisher()
    }
    let idQuery = URLQueryItem(name: "i", value: id)
    url.append(queryItems: [idQuery])
    
    return AF.request(url)
      .validate()
      .publishDecodable(type: Dessert.self)
      .value()
  }
}
