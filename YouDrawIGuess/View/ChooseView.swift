//
//  ChooseView.swift
//  YouDrawIGuess
//
//  Created by  on 2020/1/31.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class ChooseView: NSObject {
    
    @IBOutlet weak var playerLable: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    ///選擇人數
    @IBAction func stepperClick(_ sender: Any) {
        playerLable.text = "\(Int(stepper.value))"
    }
    
    ///載入畫圖頁面
    func loadDrawGameViewController() -> DrawGameViewController {
        let vc = UIStoryboard.init(name: "DrawGuess", bundle: nil).instantiateViewController(withIdentifier: "DrawGameViewController") as! DrawGameViewController
        UserDefaults.standard.set(0, forKey: "roundNum")
        UserDefaults.standard.set([], forKey: "scoreArray")
        return vc
    }
    
    ///設定AlertController
    func ruleToastDisplay() -> UIAlertController {
        let rule = UIAlertController(title: "游戏说明", message: "请先填写人数(最多10人，最少2人)，\n并选择一个方向来挑战，\n游戏开始后系统将会随机出一个题目，\n请用画出物体的方式来让其他玩家猜。\n\n猜对的人将获得2分，错的人无分数；\n当有n位玩家答对时，\n画图的人即可得到n分！", preferredStyle: .alert)
        let ok = UIAlertAction(title: "确认", style: .default, handler: nil)
        rule.addAction(ok)
        return rule
    }
}
