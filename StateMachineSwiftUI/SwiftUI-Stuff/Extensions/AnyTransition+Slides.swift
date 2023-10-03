//
//  AnyTransition+Slides.swift
//  StateMachineSwiftUI
//
//  Created by huse on 3/10/23.
//

import SwiftUI

extension AnyTransition {
  static var slideForward: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .move(edge: .trailing),
      removal: .offset(x: -100, y: 0)
    )
  }
}
