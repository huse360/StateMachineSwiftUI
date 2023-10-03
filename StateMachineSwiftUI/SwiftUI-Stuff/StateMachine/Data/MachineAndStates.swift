 ///  bgcolor = gray12
    //Red gray
    /// node [color = "#d90429"];
    /// node [fontcolor = "#ef233c"]

    /// edge [color = "#8d99ae"]
    /// edge [fontcolor = "#2b2d42"]
    
    ///Red dark blue
    /// node [color = "#d62828"];
    /// node [fontcolor = "#003049"]

    /// edge [color = "#fcbf49"]
    /// edge [fontcolor = "#f77f00"]
    
    ///Black brown
    /// node [color = "#000000"];
    /// node [fontcolor = "#282A3A"]

    /// edge [color = "#C69749"]
    /// edge [fontcolor = "#735F32"]
    
    /// dual red blue
    /// node [color = "#D61C4E"];
    /// node [fontcolor = "#293462"]

    /// edge [color = "#293462"]
    /// edge [fontcolor = "#D61C4E"]
    
    /// joyfull
    /// node [style = filled]
    /// node [fillcolor = "#FF5F00"];
    /// node [color = "#B20600"];
    /// node [fontcolor = white]
    /// node [penwidth = 4.2]

    /// edge [color = "#B20600"]
    /// edge [fontcolor = black]

    ///#Dot

    /// layout="dot";

    /// nodesep = 2;
    /// minlen = 100;
    /// start = 13;
    /// node [shape = egg];
    /// edge [len=4.5];
    /// edge [penwidth = 2.2]

    /// node [color = "#AEB6BF"];
    /// node [fontcolor = "#D35400"]
    /// node [orientation = 90]

    /// edge [color = "#CCD1D1"]
    /// edge [fontcolor = "#3498DB"]


    
    ///#EndDot
//
//  MachineAndStates.swift
//  SwitchViews
//
//  Created by Hussein Taisir Nazarala Lopez on 28/09/23.
//

import Foundation

struct MachineAndStates: MachineAndStatesProtocol {
  typealias StateFlowType = StateFlow<MessageID, StateID>
  typealias StatesType = States<StateID, MachineData>
  typealias MachineType = Machine<StateID, StateFlowType>

  static func initMachine() -> MachineType {
    var machine: MachineType = [:]
    ///#States
    machine[.desert] = [
        .openDoor : .room1,
        .digMore : .stairs,
    ]
    machine[.room1] = [
        .hallway : .room2,
        .goDown : .room3,
        .openDoor : .spider
    ]
    machine[.room2] = [
        .hallway : .room1,
        .sitInChair : .treasure,
        .openDoor : .spider
    ]
    machine[.stairs] = [
        .openDoor : .room1,
        .goDown : .room3

    ]
    machine[.spider] = [
        .openRightDoor : .room2,
        .openLeftDoor : .room1
    ]

    machine[.room3] = [
       .openDoor : .lava,
        .goUp : .room1
    ]
    machine[.lava] = [
        .goBack : .room3,
    ]
    machine[.treasure] = [
      .restart: .initial
    ]
    ///#EndStates
    return machine
  }

  static func initStates() -> StatesType {
    var states: StatesType = [:]
    let imageNames: [String] = ImageNames.getImages()

    states[.desert] = MachineData(
      text : "While digging for treasure in the desert, you find a door",
      imageName : imageNames[0]
    )

    states[.room1] = MachineData(
      text : "You find a room with a door, a hallway, and a ladder going down long.",
      imageName : imageNames[1]
    )

    states[.room2] = MachineData(

      text : "This room has a chair in the middle. \nThere is a door and a hallway here",
      imageName : imageNames[2]

    )

    states[.stairs] = MachineData(
      text : "Under the door, you find some stairs",
      imageName : imageNames[3]
    )

    states[.spider] = MachineData(
      text : "Yikes! \nThe room has a giant spider in it. \nThe room also has two doors",
      imageName : imageNames[4]
    )

    states[.lava] = MachineData(
      text : "The room has lava in it.\n You have to go back",
      imageName : imageNames[5]
    )

    states[.room3] = MachineData(
      text : "You find a room with a door and a ladder going up",
      imageName : imageNames[6]

    )

    states[.treasure] = MachineData(
      text : "When you sit in the chair,\n the treasure falls from the ceiling.\n You win!",
      imageName : imageNames[7]
    )
    return states
  }
}

