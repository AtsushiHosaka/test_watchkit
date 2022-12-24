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
    
    @State var isCollecting = false
    
    var viewModel = AnimalListViewModel()
    
    @EnvironmentObject var heartbeatManager: HeartbeatManager
    
    var body: some View {
        
        VStack {
            Text("heartbeat: \(heartbeatManager.heartRate)")
                .padding()
            Text("average: \(heartbeatManager.averageHeartRate)")
                .padding()
            Button("collect", action: {
                
                self.isCollecting = !self.isCollecting
                
                self.buttonPressed()
            })
            
        }
        .onAppear {
            heartbeatManager.requestAuthorization()
        }
//        List(0..<animals.count) { index in
//            Button {
//                self.sendMessage(index: index)
//            } label: {
//                HStack {
//                    Text(self.emojiAnimals[index])
//                        .font(.title)
//                        .padding()
//                    Text(self.animals[index])
//                }
//            }
//        }
//        .listStyle(CarouselListStyle())
//        .navigationTitle(Text("Animal List"))
    }
    
    private func buttonPressed() {
        
        if isCollecting {
            
            heartbeatManager.startWorkout(workoutType: .running)
        }else {
            
            heartbeatManager.endWorkout()
            sendMessage()
        }
    }
    
    private func sendMessage() {
        
        let messages: [String: Any] = ["average": heartbeatManager.averageHeartRate]
        
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
