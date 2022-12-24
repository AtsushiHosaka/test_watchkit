//
//  test_watchkit_WatchAppApp.swift
//  test_watchkit WatchApp Watch App
//
//  Created by 保坂篤志 on 2022/12/24.
//

import SwiftUI
import WatchConnectivity

@main
struct test_watchkit_WatchApp_Watch_AppApp: App {
    
    @StateObject private var heartbeatManager = HeartbeatManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(heartbeatManager)
        }
    }
}
