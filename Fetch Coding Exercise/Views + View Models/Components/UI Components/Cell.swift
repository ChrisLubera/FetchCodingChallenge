//
//  Cell.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import SwiftUI

/// The cell that will display a picture and the name of a ``Meal`` object
struct MealCell: View {
  
  private let meal: Meal
  
  /// Creates the cell that displays the ``Meal``'s information
  /// - Parameter meal: The ``Meal`` object to be display in the cell
  init(meal: Meal) {
    self.meal = meal
  }
  
  /// The body containing the cell
  var body: some View {
    HStack {
      AsyncImage(url: URL(string: meal.strMealThumb)) { image in
        image
          .resizable()
      } placeholder: {
        VStack {
          ProgressView()
        }
      }
      .frame(width: 70 , height: 70)
      .scaledToFill()
      
      Text(meal.strMeal)
        .foregroundStyle(.white)
        .font(.title)
        .fontWeight(.semibold)
        .minimumScaleFactor(0.01)
        .lineLimit(1)
      Spacer()
      Image(systemName: "chevron.right")
        .foregroundStyle(.white)
        .padding(.trailing)
    }
    .background(Color("AppPink"))
    .cornerRadius(8.0)
    .padding()
    .frame(height: 70)
    .shadow(radius: 5)
  }
}

#Preview {
    MealCell(meal: Meal(strMeal: "Meal Name", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "00000"))
      .padding()
      .blueBackground()
  
}
