//
//  ContentView.swift
//  test_watchkit WatchApp Watch App
//
//  Created by 保坂篤志 on 2022/12/24.
//

import SwiftUI

struct ContentView: View {
    let animals = ["ネコ", "イヌ", "ハムスター", "ドラゴン", "ユニコーン"]
    let emojiAnimals = ["🐱", "🐶", "🐹", "🐲", "🦄"]
    
    var viewModel = AnimalListViewModel()
    
    var body: some View {
        List(0..<animals.count) { index in
            Button {
                self.sendMessage(index: index)
            } label: {
                HStack {
                    Text(self.emojiAnimals[index])
                        .font(.title)
                        .padding()
                    Text(self.animals[index])
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationTitle(Text("Animal List"))
    }
    
    private func sendMessage(index: Int) {
        
        let messages: [String: Any] = ["animal": animals[index], "emoji": emojiAnimals[index]]
        
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
