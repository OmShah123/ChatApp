//
//  ContentView.swift
//  ChatApp
//
//  Created by Shah, Om on 2/14/24.
//

import SwiftUI

struct MessageView: View {
    @State private var messageText = ""
    @State private var messages: [String] = []


    var body: some View {
        VStack {
            List(messages, id: \.self) { message in
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                    Text(message)
                }
            }
            .padding()

            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle")
                        .font(.title)
                        .padding()
                }
            }
        }
        .navigationTitle("Chat App")
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        messages.append(messageText)
        messageText = ""
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            MessageView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
