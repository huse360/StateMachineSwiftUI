//
//  MachineViewModel.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import SwiftUI



final class MachineViewModel: MachineViewModelProtocol {

  let machine: ViewModelMachineType
  let states: ViewModelStatesType
  var currentState: StateID
  var prevState: StateID

  init (
    machine: MachineType = MachineAndStates.initMachine(),
    states: StatesType = MachineAndStates.initStates(),
    currentState: StateID = .initial
  ) {
    self.machine = machine
    self.states = states
    self.currentState = currentState
    self.prevState = currentState
  }

  func getMessagesFor(state: StateID) -> [ MessageID ] {
    var options: [MessageID] = []
    machine[state]?.forEach { key, value in
      options.append(key)
    }
    return options
  }

  func getCurrentMessages() -> [ MessageID ] {
    getMessagesFor(state: currentState)
  }

  func getPreviousMessages() -> [ MessageID ] {
    getMessagesFor(state: prevState)
  }

  func getDataFor(state: StateID) -> MachineData {
    states[state] ?? MachineData(text: "??", imageName: "")
  }

  func getCurrentData() -> MachineData {
    states[currentState] ?? MachineData(text: "??", imageName: "")
  }

  func getPreviousData() -> MachineData {
    states[prevState] ?? MachineData(text: "??", imageName: "")
  }

  func sendMessage(msg : MessageID) {
      guard let nextState =
        machine[currentState]?[msg]
      else {
        return
      }
      prevState = currentState
      currentState = nextState
  }
}

