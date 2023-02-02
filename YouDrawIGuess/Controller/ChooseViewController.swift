//
//  ChooseViewController.swift
//  YouDrawIGuess
//
//  Created by  on 2020/1/31.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBOutlet var views: ChooseView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ///資訊點擊
    @IBAction func infoClick(_ sender: Any) {
        self.present(views.ruleToastDisplay(), animated: true, completion: nil)
    }
    
    ///點擊選擇關卡方向
    @IBAction func gameStart(_ sender: UIButton) {
        let vc = views.loadDrawGameViewController()
        vc.mChoose = sender.tag
        vc.mPlayerCount = Int(views.stepper.value)
        self.present(vc, animated: true, completion: nil)
    }
}
