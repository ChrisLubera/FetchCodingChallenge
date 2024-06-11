//
//  ViewStatus.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import Foundation

/// Which view should be displayed
enum ViewStatus {
  /// Used when the view is loading
  case loading
  /// Used when the view has loaded
  case loaded
  /// Used when there is an error retrieving the data
  case error
}
