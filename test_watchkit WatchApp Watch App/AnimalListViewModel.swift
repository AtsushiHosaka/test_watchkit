//
//  AnimalListViewModel.swift
//  test_watchkit WatchApp Watch App
//
//  Created by 保坂篤志 on 2022/12/24.
//

import WatchConnectivity

final class AnimalListViewModel: NSObject {
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension AnimalListViewModel: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        if let error = error {
            
            print(error.localizedDescription)
        }else {
            
            print("The session has completed activation.")
        }
    }
}
