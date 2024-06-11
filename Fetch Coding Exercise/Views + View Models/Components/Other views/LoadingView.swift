//
//  LoadingView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import SwiftUI

/// A view that signals that the data is loading
struct LoadingView: View {
  
  /// The body containing the loading view
  var body: some View {
    VStack {
      ProgressView()
      Text("Loading Data...")
        .foregroundStyle(.white)
    }
    .blueBackground()
  }
}

#Preview {
  LoadingView()
}
