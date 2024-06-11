//
//  MainLoadedView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import SwiftUI

/// The view that will be displayed when the list of ``Meal`` objects has loaded correctly
struct MainLoadedView: View {
  
  /// An array of ``Meal`` objects to be displayed in the list
  let meals: Array<Meal>
  
  /// The body containing the list of the ``Meal`` objects
  var body: some View {
    ScrollView(showsIndicators: false) {
      LazyVStack(alignment: .leading) {
        ForEach(meals) { item in
          NavigationLink(destination: {
            DetailView(viewModel: DetailViewModel(id: item.idMeal, name: item.strMeal))
          }, label: {
            MealCell(meal: item)
              .padding(.bottom, 5)
          })
        }
      }
    }
    .blueBackground()
  }
}

#Preview {
  MainLoadedView(meals: [PreviewObjects.meal1, PreviewObjects.meal2])
}
