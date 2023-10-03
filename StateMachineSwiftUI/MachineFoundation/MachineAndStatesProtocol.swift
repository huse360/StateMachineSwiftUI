//
//  MachineAndStatesProtocol.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

protocol MachineAndStatesProtocol {
  associatedtype MachineDataType
  associatedtype StateType: Hashable
  associatedtype MessageType: Hashable

  typealias StateFlowType = StateFlow<MessageType, StateType>
  typealias StatesType = States<StateType, MachineDataType>
  typealias MachineType = Machine<StateType, StateFlowType>

  static func initMachine() -> MachineType
  static func initStates() -> StatesType
}
