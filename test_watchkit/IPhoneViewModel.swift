//
//  MessageListViewModel.swift
//  test_watchkit
//
//  Created by 保坂篤志 on 2022/12/24.
//

import Foundation
import WatchConnectivity

//SwiftUIの記事を参照したためViewModelを作成しています。
//ViewControllerに統一したりViewModelじゃない名前に変えたりしても全然OKと思われます
final class IPhoneViewModel: NSObject {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension IPhoneViewModel: WCSessionDelegate {
    
    //sessionを開始
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    //メッセージを受け取った時呼び出されます
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        DispatchQueue.main.async {
            
            let receive = message["average"] as? Double ?? 0
            
            print(receive)
        }
    }
}
