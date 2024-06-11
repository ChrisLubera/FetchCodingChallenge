//
//  Meals.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import Foundation

/// An object containing the array of ``Meal`` objects. This is it's own object to assist with automatic JSON decoding
struct Meals: Codable {
  /// The array containing ``Meal`` objects
  let meals: [Meal]
}

/// An individual meal
struct Meal: Codable, Identifiable {
  /// The randomly generated UUID of the Meal
  ///
  /// This is for local use only and not to be confused with ``idMeal``. While ``idMeal`` technically could be the id, in this case we will use UUID to guarentee uniqueness, in case the API returns two objects with the same ``idMeal`` for some reason
  var id = UUID()
  /// The name of the meal
  let strMeal: String
  /// A String containting the URL to the image if the ``Meal``
  let strMealThumb: String
  /// An ID assigned by the API, which is used to call more details about the ``Dessert``
  let idMeal: String
  
  /// The keys required to unwrap the JSON object automatically
  private enum CodingKeys: String, CodingKey {
    case strMeal
    case strMealThumb
    case idMeal
  }
}

