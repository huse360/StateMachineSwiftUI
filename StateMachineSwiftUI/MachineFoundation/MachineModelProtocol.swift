//
//  MachineModelProtocol.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

protocol MachineModelProtocol {
  associatedtype MachineDataType
  associatedtype StateType: Hashable
  associatedtype MessageType: Hashable

  typealias StateFlowType = StateFlow<MessageType, StateType>
  typealias StatesType = States<StateType, MachineDataType>
  typealias MachineType = Machine<StateType, StateFlowType>

  var machine : MachineType { get }
  var states : StatesType { get }
  var currentState : StateType { get set }
  func getCurrentData() -> MachineDataType
  func sendMessage(msg : MessageType)
}
