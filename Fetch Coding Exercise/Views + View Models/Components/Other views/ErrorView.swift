//
//  ErrorView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import SwiftUI

/// A view that signals that there has been an error in getting the data
struct ErrorView: View {
  
  /// A String that describes the error
  let errorText: String
  
  /// The body containing the error message
  var body: some View {
    Text(errorText)
      .foregroundStyle(.white)
      .blueBackground()
  }
}

#Preview {
  ErrorView(errorText: "Sample Error")
}
