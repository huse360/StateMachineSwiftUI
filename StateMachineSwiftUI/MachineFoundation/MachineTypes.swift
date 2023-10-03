//
//  MachineTypes.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

typealias StateFlow<MessageType: Hashable, StateType> = [ MessageType : StateType ]
typealias Machine<StateType: Hashable, StateFlowType> = [ StateType : StateFlowType ]
typealias States<StateType: Hashable, MachineDataType> = [ StateType : MachineDataType ]
