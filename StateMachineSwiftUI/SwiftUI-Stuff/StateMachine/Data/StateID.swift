//
//  StateID.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

enum StateID: String {

  case desert = "Desert"
  case room1 = "Room #1"
  case room2 = "Room #2"
  case stairs = "Stairs"

  case spider = "Spider"
  case lava = "Lava"
  case room3 = "Room #3"
  case treasure = "The Treasure, At last!"

  static var initial: StateID {
    .desert
  }
  static var final: StateID {
    .treasure
  }
}
