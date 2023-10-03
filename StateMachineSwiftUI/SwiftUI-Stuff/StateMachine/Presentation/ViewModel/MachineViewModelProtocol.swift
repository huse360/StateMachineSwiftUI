//
//  MachineViewModelProtocol.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

protocol MachineViewModelProtocol: MachineModelProtocol, ObservableObject {
  typealias ViewModelStateFlowType = StateFlow<MessageID, StateID>
  typealias ViewModelStatesType = States<StateID, MachineData>
  typealias ViewModelMachineType = Machine<StateID, ViewModelStateFlowType>

  var prevState: StateID { get }
}
