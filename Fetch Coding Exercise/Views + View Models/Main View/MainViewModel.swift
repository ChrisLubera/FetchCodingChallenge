//
//  MainViewModel.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import Foundation
import Combine

/// The view model that powers the ``MainView``
class MainViewModel: ObservableObject {
  
  /// The ``ViewStatus`` telling the screen what view it will be displaying, depending on the status of the API call
  @Published var viewStatus = ViewStatus.loading
  /// A list containing all of the ``Meal`` objects
  var meals: [Meal] = []
  /// A readable string of an error that was returned.
  var error: String = ""
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  /// Initializes the class by getting data from the API (or an error)
  init() {
    getMeals()
  }
  
  /// Calls TheMealDP's API and either recives a list of ``Meal`` objects or an AFError.
  func getMeals() {
    Networking().getMeals()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.error = error.localizedDescription
          self.viewStatus = .error
        case .finished:
          self.viewStatus = .loaded
        }
      }, receiveValue: { meals in
        self.meals = meals.meals.sorted(by: { $0.strMeal < $1.strMeal })
      })
      .store(in: &cancellableSet)
  }
}
