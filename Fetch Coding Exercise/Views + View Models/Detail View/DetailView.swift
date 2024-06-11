//
//  DetailView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import SwiftUI

/// A view that will display information about a ``Dessert`` object
struct DetailView: View {
  
  /// The ``DetailViewModel`` that will power the view
  @StateObject var viewModel: DetailViewModel
  
  /// The body containing either the ``ErrorView``, ``LoadingView`` or ``DetailLoadedView`` depending on the ``ViewStatus``
  var body: some View {
    switch viewModel.viewStatus {
    case .loaded:
      DetailLoadedView(dessert: viewModel.dessert!)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.name)
    case .loading:
      LoadingView()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.name)
    case .error:
      ErrorView(errorText: viewModel.error)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.name)
    }
  }
}

#Preview {
  DetailView(viewModel: DetailViewModel(id: "53049", name: "Test"))
}
