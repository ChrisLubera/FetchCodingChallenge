//
//  MainView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import SwiftUI

/// A View containing a list of all of the ``Meal`` objects
struct MainView: View {
  
  /// The ``MainViewModel`` powering this view
  @StateObject private var viewModel = MainViewModel()
  
  /// The initializer for the view. Handles setting the NavigationBar to the proper appearance
  init() {
    UINavigationBar.appearance().barTintColor = UIColor(named: "LightBlue")
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white ]
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white ]
  }
  
  /// The body containing either the ``ErrorView``, ``LoadingView`` or ``MainLoadedView`` depending on the ``ViewStatus``
  var body: some View {
    NavigationStack {
      switch viewModel.viewStatus {
      case .loading:
        LoadingView()
      case .loaded:
        MainLoadedView(meals: viewModel.meals)
          .navigationTitle("Desserts")
      case .error:
        ErrorView(errorText: viewModel.error)
      }
    }
    .accentColor(.white)
  }
}

#Preview {
  MainView()
}
