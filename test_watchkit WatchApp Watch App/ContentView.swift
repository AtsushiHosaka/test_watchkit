//
//  ContentView.swift
//  test_watchkit WatchApp Watch App
//
//  Created by 保坂篤志 on 2022/12/24.
//

import SwiftUI

struct ContentView: View {
    
    //@Stateをつけると、その変数を変更した時、それを用いて表示されているテキストなどが更新されます。
    @State var isCollecting = false
    @State var buttonText = "start"
    
    var viewModel = WatchViewModel()
    
    @EnvironmentObject var heartbeatManager: HeartbeatManager
    
    var body: some View {
        
        //縦に並べます
        VStack {
            Text("heartbeat: \(heartbeatManager.heartRate)")
                .padding()
            Text("average: \(heartbeatManager.averageHeartRate)")
                .padding()
            Button(buttonText, action: {
                
                self.isCollecting = !self.isCollecting
                
                if isCollecting {
                    
                    buttonText = "stop"
                }else {
                    
                    buttonText = "start"
                }
                
                self.buttonPressed()
            })
            
        }
        .onAppear {
            heartbeatManager.requestAuthorization()
        }
    }
    
    private func buttonPressed() {
        
        if isCollecting {
            
            heartbeatManager.startWorkout()
        }else {
            
            heartbeatManager.endWorkout()
            sendMessage()
            
            heartbeatManager.resetWorkout()
        }
    }
    
    func sendMessage() {
        
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
