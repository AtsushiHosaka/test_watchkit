//
//  AnimalListViewModel.swift
//  test_watchkit WatchApp Watch App
//
//  Created by 保坂篤志 on 2022/12/24.
//

import Foundation
import WatchConnectivity

final class WatchViewModel: NSObject {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension WatchViewModel: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        if let error = error {
            
            print(error.localizedDescription)
        }else {
            
            print("The session has completed activation.")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        let action = message["action"] as? String ?? ""
        
        //iPhone側ではメッセージは値の受け渡しとして使っていますが、こっちではAppleWatchに要求する行動、ここでは心拍数の平均値を送って！という行動の指定として使っています。
        if action == "sendAverage" {
            
            let averageHeartRate = HeartbeatManager.shared.averageHeartRate
            
            let messages: [String: Any] = ["average": averageHeartRate]
            
            //iPhoneに平均値を送り返します
            session.sendMessage(messages, replyHandler: nil) { (error) in
                
                print(error.localizedDescription)
            }
            
            
        }else if action == "start" {
            
            HeartbeatManager.shared.startWorkout()
            
        }else if action == "end" {
            
            HeartbeatManager.shared.endWorkout()
            
            let averageHeartRate = HeartbeatManager.shared.averageHeartRate
            
            let messages: [String: Any] = ["average": averageHeartRate]
            
            //iPhoneに平均値を送り返します
            session.sendMessage(messages, replyHandler: nil) { (error) in
                
                print(error.localizedDescription)
            }
        }
    }
}
