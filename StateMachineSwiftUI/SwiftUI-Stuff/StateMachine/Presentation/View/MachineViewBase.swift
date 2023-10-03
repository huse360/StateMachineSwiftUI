//
//  MachineViewBase.swift
//  StateMachineSwiftUI
//
//  Created by huse on 3/10/23.
//

import SwiftUI

struct MachineViewBase: View {
  let data: MachineData
  let title: String
  let messages: [ MessageID ]
  @Binding var messageSent: MessageID
  let action: () -> Void

  init(data: MachineData,
       title: String,
       messages : [MessageID],
       messageSent: Binding<MessageID>,
       action: @escaping () -> Void
  ) {
    self.data = data
    self.title = title
    self.messages = messages
    self._messageSent = messageSent
    self.action = action
  }
  var body: some View {
    ZStack {
      VStack (spacing: 15) {
        Text(title)
        Image(data.imageName)
          .resizable()
          .scaledToFit()
          .padding()
        Text(data.text)
        ForEach (0 ..< messages.count, id: \.self) { index in
          LargeButton(
            title: "\(messages[index].rawValue)",
            backgroundColor: Color.blue
          ) {
            messageSent = messages[index]
            action()
          }
        }
      }
    }
    .edgesIgnoringSafeArea(.all)
    .animation(nil, value: UUID())
  }
}
