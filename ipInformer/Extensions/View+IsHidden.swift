//
//  View+IsHidden.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import SwiftUI

extension View {
  /// Hide or show the view based on a boolean value.
  ///
  /// Example for visibility:
  /// ```
  /// Text("Label")
  ///     .isHidden(true)
  /// ```
  ///
  /// Example for complete removal:
  /// ```
  /// Text("Label")
  ///     .isHidden(true)
  /// ```
  ///
  /// - Parameters:
  ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
  @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
    if !hidden {
      self
    }
  }
}
