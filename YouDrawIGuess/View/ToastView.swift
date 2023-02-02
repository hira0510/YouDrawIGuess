//
//  ToastView.swift
//  YouDrawIGuess
//
//  Created by  on 2020/2/3.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

enum type {
    case end
    case notYet
}

class ToastView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var middleTitle: UILabel!
    @IBOutlet weak var scoreTitle: UILabel!
    @IBOutlet weak var allScoreTitle: UILabel!
    @IBOutlet weak var nextBtn: UIButton!

    public var didClickDismissBtnHandler: (() -> Void)? = { }
    private var scoreArray: [Int] = UserDefaults.standard.array(forKey: "scoreArray") as! [Int]
    private var trueAnser: String = ""

    init(frame: CGRect, type: type, anser: String) {
        super.init(frame: frame)
        commonInit()
        trueAnser = anser
        middleTitle.text = ""
        configSetLabel(type: type)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    @IBAction func dismiss(_ sender: UIButton) {
        removeSelf()
        didClickDismissBtnHandler?()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("ToastView", owner: self, options: nil)
        self.addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    /// 移除自己
    private func removeSelf() {
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.alpha = 0.0
        }) { (_) in
            self.removeFromSuperview()
        }
    }

    /// 設定Lable的字
    func configSetLabel(type: type) {
        topTitle.text = type == .end ? "游戏结束！" : "正确解答"
        scoreTitle.text = type == .end ? "总成绩：" : "目前分数："
        displayScore()
        middleTitle.text = type == .end ? middleTitle.text : trueAnser
        type == .end ? nextBtn.setTitle("回选择画面", for: .normal) : nextBtn.setTitle("下一局", for: .normal)
    }

    /// 分數顯示
    func displayScore() {
        middleTitle.text?.append("玩家 ")
        for (index, value) in scoreArray.enumerated() {
            if value == scoreArray.max() {
                middleTitle.text?.append("\(index + 1) ")
            }
            if scoreArray.count <= 4 {
                let n = index == 3 ? "":  "\n"
                allScoreTitle.text?.append("玩家\(index + 1)：\(value)分\(n)")
            } else if index % 2 == 0 && index != 9 {
                allScoreTitle.text?.append("玩家\(index + 1)：\(value)分")
            } else {
                allScoreTitle.text?.append("     玩家\(index + 1)：\(value)分\n")
            }
        }
        middleTitle.text?.append("获胜！！")
    }
}
