//
//  ViewController.swift
//  test_watchkit
//
//  Created by 保坂篤志 on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isReachable = "NO"
    var viewModel = IPhoneViewModel()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //AppleWatchに現在の心拍数の平均値を送るよう要求
    //AppleWatchの画面が黒くなってるだけなら取得できます
    //AppleWatchでアプリを閉じる（一覧画面に戻る）と取得できません
    //したのisReachableがYESなら基本取得できるようです
    @IBAction func buttonPressed(_ sender: Any) {
        
        let messages: [String: Any] = ["action": "sendAverage"]
        
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            
            print(error.localizedDescription)
        }
    }
    
    //AppleWatchとiPhoneが接続できているか
    //AppleWatchでアプリを開いていないとNOになります
    @IBAction func checkIsReachable(_ sender: Any) {
        
        if viewModel.session.isReachable {
            
            isReachable = "YES"
            print("yes")
        }else {
            
            isReachable = "NO"
            print("no")
        }
        
        label.text = String(isReachable)
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        let messages: [String: Any] = ["action": "start"]
        
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            
            print(error.localizedDescription)
        }
    }
    
    @IBAction func endButtonPressed(_ sender: Any) {
        
        let messages: [String: Any] = ["action": "end"]
        
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            
            print(error.localizedDescription)
        }
    }
}

