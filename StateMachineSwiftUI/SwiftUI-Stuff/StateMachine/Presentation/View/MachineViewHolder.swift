//
//  MachineViewHolder.swift
//  StateMachineSwiftUI
//
//  Created by huse on 2/10/23.
//

import SwiftUI

//struct MachineViewHolder: View {
//  @Environment(\.presentationMode) var presentationMode
//  var body: some View {
//    VStack {
//      Text("SwiftUI view")
//      Button("Back") {
//        presentationMode.wrappedValue.dismiss()
//      }
//    }
//  }
//}

struct MachineViewHolder: View {
  @Environment(\.presentationMode) var presentationMode
  let viewModel: MachineViewModel = MachineViewModel()
  @State var newMessage: MessageID = .empty
  @State var push: Bool = false

  var body: some View {
    ZStack {
      
      if push {
        viewB.transition(.slideForward)
        viewA.transition(.slideForward)
      }
      if !push {
        viewB.transition(.slideForward)
        viewA.transition(.slideForward)

      }
    }
  }

  var viewA: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
      MachineViewBase(
        data: viewModel.getCurrentData(),
        title: viewModel.currentState.rawValue,
        messages: viewModel.getCurrentMessages(),
        messageSent: $newMessage) {
          if viewModel.currentState == .treasure {
            presentationMode.wrappedValue.dismiss()
          }
          withAnimation(.easeOut) {
            self.push.toggle()
            viewModel.sendMessage(msg: newMessage)
          }
        }
      }
    }
  var viewB: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
      MachineViewBase(
        data: viewModel.getCurrentData(),
        title: viewModel.currentState.rawValue,
        messages: viewModel.getCurrentMessages(),
        messageSent: $newMessage) {
        }
      }
    }
  }

struct MachineViewHolder_Previews: PreviewProvider {
    static var previews: some View {
        MachineViewHolder()
    }
}
