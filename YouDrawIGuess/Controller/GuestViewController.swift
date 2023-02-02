//
//  GuestViewController.swift
//  YouDrawIGuess
//
//  Created by  on 2020/2/3.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class GuestViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var playerAnser: UILabel!
    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    public var mImageView: UIImage?
    ///正確答案
    public var mTrueAnser: String = ""
    ///遊玩人數
    public var mPlayerCount: Int = 2
    ///遊戲時間
    private var mGameTimer: Timer?
    ///輪到哪個人輸入答案
    private var mWhichPeople: Int = 1
    ///第幾輪遊戲&誰是畫圖的人
    private var mRoundNum: Int = UserDefaults.standard.integer(forKey: "roundNum")
    ///計分陣列
    private var mFraction: [Int] = UserDefaults.standard.array(forKey: "scoreArray") as! [Int]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSet()
        displayImage.image = mImageView
        playerTextField.delegate = self
        if mFraction.count < 1 {
            for _ in 0..<mPlayerCount {
                mFraction.append(0)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mRoundNum += 1
        UserDefaults.standard.set(mRoundNum, forKey: "roundNum")
        nextPlayerIsDrewer(bool: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    ///時間倒數
    private func timerSet() {
        var t = 30
        timeLabel.text = "Time: 30s"
        mGameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
            if t != 0 {
                t = t - 1
                self.timeLabel.text = String(format: "Time: %2ds", t % 60)
            } else {
                self.completeAndTimeup()
            }
        })
    }
    
    /// 重置timer
    private func resetTimer() {
        mGameTimer?.invalidate()
        mGameTimer = nil
    }
    
    ///時間到或按完成時的方法
    private func completeAndTimeup() {
        playerTextField.resignFirstResponder()
        playerAnser.text?.append("玩家\(mWhichPeople)： \(String(playerTextField.text ?? ""))\n")
        resetTimer()
        if playerTextField.text == mTrueAnser {
            //答對
            mFraction[mWhichPeople - 1] += 2
            mFraction[mRoundNum - 1] += 1
        }
        
        UserDefaults.standard.set(mFraction, forKey: "scoreArray")
        if mWhichPeople > mPlayerCount { //１round結束
            playerTextField.placeholder = ""
            playerTextField.isEnabled = false
            roundEndOrGameEnd(bool: true)
        } else { //１round未結束
            mWhichPeople += 1
            nextPlayerIsDrewer(bool: true)
        }
        playerTextField.text = ""
    }
    
    /// 下一個是否輪到畫圖者
    private func nextPlayerIsDrewer(bool: Bool) {
        resetTimer()
        if mWhichPeople == mRoundNum {
            //下一個輪到畫圖者
            timerSet()
            playerTextField.placeholder = "玩家\(mRoundNum + 1)请输入答案"
            playerAnser.text?.append("玩家\(mRoundNum)： 画图者\n")
            mWhichPeople += 1
            roundEndOrGameEnd(bool: bool)
        } else {
            if mWhichPeople > mPlayerCount {
                //１round結束
                playerTextField.placeholder = ""
                playerTextField.isEnabled = false
                roundEndOrGameEnd(bool: bool)
            } else {
                //１round未結束
                timerSet()
                playerTextField.placeholder = "玩家\(mWhichPeople)请输入答案"
            }
        }
    }
    
    ///判斷是否結束,bool -> 是否要跑func
    private func roundEndOrGameEnd(bool: Bool) {
        guard bool == true else { return }
        if mRoundNum == mPlayerCount {
            //全部結束回選擇頁面
            resetTimer()
            toastDisplay(type: .end).didClickDismissBtnHandler = {
                self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
            }
        } else if mWhichPeople > mPlayerCount {
            //回畫圖頁面進行下１round
            resetTimer()
            toastDisplay(type: .notYet).didClickDismissBtnHandler = {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    ///顯示吐司
    private func toastDisplay(type: type) -> ToastView {
        let view = ToastView(frame: UIScreen.main.bounds, type: type, anser: mTrueAnser)
        self.view.addSubview(view)
        return view
    }
}

extension GuestViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        completeAndTimeup()
        return true
    }
}
