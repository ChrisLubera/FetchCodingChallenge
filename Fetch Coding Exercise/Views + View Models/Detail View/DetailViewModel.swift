//
//  DetailViewModel.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import Foundation
import Combine

/// The view model that powers the ``DetailView``
class DetailViewModel: ObservableObject {
  
  /// The ``Dessert`` that will be returned by TheMealDB's API
  @Published var dessert: Dessert?
  /// A readable string of an error that was returned
  @Published var error: String = ""
  /// The name of the Dessert to be displayed
  var name: String = ""

  private var cancellableSet: Set<AnyCancellable> = []
  
  /// Creates the view model that powers the view
  ///
  /// - Parameters:
  ///   - id: A String containing the ID that will be used in the call to TheMealDB's API
  ///   - name: A String containing the name of the ``Dessert``, to be displayed in the Navigation Bar
  init(id: String, name: String) {
    self.name = name
    getDessert(id: id)
  }
  
  /// Calls TheMealDP's API and either recives a  ``Dessert``  or an AFError.
  /// - Parameter id: A String with the 5 digit id of the ``Dessert``
  func getDessert(id: String) {
    Networking().getDessert(id: id)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          print(error)
          self.error = error.localizedDescription
        case .finished:
          self.error = ""
        }
      }, receiveValue: { dessert in
        self.dessert = dessert
      })
      .store(in: &cancellableSet)
  }
}
