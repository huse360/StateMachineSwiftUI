//
//  MachineBuildViewProtocol.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 29/09/23.
//

import SwiftUI

protocol MachineBuildViewProtocol {
  associatedtype Content: View
  func buildView(state: Binding<StateID>) -> Content
}

