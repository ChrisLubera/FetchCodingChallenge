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
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color("LightBlue")
          .ignoresSafeArea()
        if viewModel.error != "" {
          Text(viewModel.error)
            .foregroundStyle(.white)
        } else if (viewModel.meals.isEmpty) {
          VStack {
            ProgressView()
            Text("Loading Data...")
              .foregroundStyle(.white)
          }
        } else {
          ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
              ForEach(viewModel.meals) { item in
                NavigationLink(destination: {
                  DetailView(viewModel: DetailViewModel(id: item.idMeal, name: item.strMeal))
                }, label: {
                  Cell(text: item.strMeal, imageURL: item.strMealThumb)
                    .padding(.bottom, 5)
                })
              }
            }
          }
          .navigationTitle("Desserts")
        }
      }
    }
    .accentColor(.white)
  }
}

#Preview {
  MainView()
}
