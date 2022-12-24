//
//  ViewController.swift
//  test_watchkit
//
//  Created by 保坂篤志 on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isReachable = "NO"
    var viewModel = MessageListViewModel()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    var sendInt: Int = 0
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        sendInt += 1
        
        
    }
    
    @IBAction func reachable(_ sender: Any) {
        
        if viewModel.session.isReachable {
            
            isReachable = "YES"
            print("yes")
        }else {
            
            isReachable = "NO"
            print("no")
        }
        
        label.text = String(isReachable)
    }
}

