//
//  Dessert.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import Foundation

/// More information about the ``Meal``, pulled up from TheMealDB's API
struct Dessert: Codable {
  
  /// An Array containing the Dictionary where all of the keys and values are stored for the Dessert object
  private let meals: [[String: String?]]
  
  /// Gets the name of the Dessert
  /// - Returns: A String with the name of the desert
  func returnName() -> String {
    return unwrapKey(key: "srtMeal")
  }
  
  /// Gets the instructions required to make the dessert
  /// - Returns: A String with the instructions
  func returnInstructions() -> String {
    return unwrapKey(key: "strInstructions")
  }
  
  /// Gets the URL to the image of the dessert
  /// - Returns: A String with the URL to image of the dessert
  func returnImageURL() -> String {
    return unwrapKey(key: "strMealThumb")
  }
  
  /// Gets the list of ingredients required to make the dessert
  /// - Returns: An Array full of ``Ingredient`` objects
  func returnIngredients() -> [Ingredient] {
    
    var array: [Ingredient] = []
    
    // This is... interesting formatting on TheMealDB's part here
    var i = 1
    while i<=20 {
      let ingredientString = "strIngredient" + String(i)
      let measurString = "strMeasure" + String(i)
      
      let ingredient = unwrapKey(key: ingredientString)
      let measure = unwrapKey(key: measurString)
      
      if ingredient == "" {
        break
      }
      array.append(Ingredient(item: ingredient, measure: measure))
      i+=1
    }
    return array
  }
  
  /// A function that unwraps a given key from the Dessert dictionary, provided by the JSON
  ///  - Parameter key: The key for the value you would like to fetch
  /// - Returns: A String with the value
  private func unwrapKey(key: String) -> String {
    let errorString = "Error unwrapping \(key)"
    guard let meal = meals.first else {
      return errorString
    }
    return (meal[key] ?? errorString) ?? errorString
  }
}
