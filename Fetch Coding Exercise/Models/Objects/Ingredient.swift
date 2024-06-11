//
//  Ingredient.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/7/24.
//

import Foundation

/// A model representing a single ingredient required to make a ``Dessert``
struct Ingredient: Identifiable {
  var id: UUID
  var item: String
  var measure: String
  
  /// Creates an Ingredient with the food item and the measurement required
  ///
  /// - Parameters:
  ///   - Item: The food item required
  ///   - Measure: How much of the Item is required
  init(item: String, measure: String) {
    self.id = UUID()
    self.item = item
    self.measure = measure
  }
}
