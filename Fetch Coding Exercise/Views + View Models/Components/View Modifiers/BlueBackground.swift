//
//  BlueBackground.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import SwiftUI

/// A View Modifier that turns the background blue
struct BlueBackground: ViewModifier {
  func body(content: Content) -> some View {
    ZStack {
      Color("LightBlue")
        .ignoresSafeArea()
      content
    }
  }
}

/// Turns the background the LightBlue color declared in Assets
public extension View {
  func blueBackground() -> some View {
    modifier(BlueBackground())
  }
}
