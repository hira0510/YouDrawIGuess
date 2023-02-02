//
//  DrawGameViewController.swift
//  YouDrawIGuess
//
//  Created by  on 2020/1/31.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class DrawGameViewController: UIViewController {

    @IBOutlet weak var drawViews: DrawAreaView!
    @IBOutlet weak var toolbarViews: ToolbarView!
    @IBOutlet var views: DrowGameViews!
    
    ///題目model
    let mModel = ChooseModel()
    ///按鈕array
    var mBtnArray: [UIButton] = []
    ///遊戲時間
    var mGameTimer: Timer?
    ///題目選擇
    var mChoose: Int = 0
    ///人數
    var mPlayerCount: Int = 2
    ///題目
    var mModels: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolbarViewXib()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetAll()
    }
    
    ///時間倒數
    func timerSet() {
        var t = 30
        mGameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
            if t != 0 {
                t = t - 1
                self.toolbarViews.timeTitle.text = String(format: "Time: %2ds", t % 60)
            } else {
                self.completeAndTimeup()
            }
        })
    }
    
    ///顯示題目
    func questionChoose() {
        self.toolbarViews.timeTitle.text = "Time: 30s"
        var model: [String] = []
        if mChoose != 7 {
            let tagModel = [mModel.tag1, mModel.tag2, mModel.tag3, mModel.tag4, mModel.tag5, mModel.tag6]
            model = tagModel[mChoose - 1]
            mModels = model.randomElement() ?? ""
            views.questionTitle.text = "题目： " + mModels
            timerSet()
        } else {
            let customView = CustomWordView(frame: self.view.frame)
            customView.clickRemoveBtnHandler = { [weak self] word in
                guard let `self` = self else { return }
                self.mModels = word
                self.views.questionTitle.text = "题目： " + self.mModels
                self.timerSet()
            }
            self.view.addSubview(customView)
        }
    }
    
    func setupToolbarViewXib() {
        mBtnArray = [toolbarViews.grayColorBtn, toolbarViews.blackColorBtn, toolbarViews.redColorBtn, toolbarViews.orangeColorBtn, toolbarViews.yellowColorBtn, toolbarViews.greenColorBtn, toolbarViews.blueColorBtn, toolbarViews.purpleColorBtn]
        
        for i in 0..<mBtnArray.count {
            mBtnArray[i].addTarget(self, action: #selector(colorBtnClick(sender:)), for: .touchUpInside)
        }
        toolbarViews.cleanBtn.addTarget(self, action: #selector(clearBtnClick), for: .touchUpInside)
        toolbarViews.eraserBtn.addTarget(self, action: #selector(eraserBtnClick), for: .touchUpInside)
        toolbarViews.completeBtn.addTarget(self, action: #selector(completeAndTimeup), for: .touchUpInside)
        toolbarViews.lineWidthSlider.addTarget(self, action: #selector(widthSliderChange), for: .valueChanged)
    }
    
    func resetAll() {
        questionChoose()
        drawViews.clearCanvas()
        views.timeUpView.isHidden = true
        drawViews.canDrow = true
    }

    ///點擊顏色按鈕->改變slider顏色與畫筆顏色
    @objc func colorBtnClick(sender: UIButton) {
        toolbarViews.lineWidthSlider.tintColor = sender.backgroundColor
        drawViews.lineColor = sender.backgroundColor?.cgColor ?? UIColor.gray.cgColor
        toolbarViews.eraserBtn.isEnabled = true
        for i in 0..<mBtnArray.count {
            mBtnArray[i].alpha = 1
        }
        sender.alpha = 0.3
    }
    
    ///移動slider->改變畫筆的寬
    @objc func widthSliderChange() {
        drawViews.lineWidth = CGFloat(toolbarViews.lineWidthSlider.value)
    }
    
    ///點擊clearBtn->清除所有畫筆紀錄
    @objc func clearBtnClick() {
        drawViews.path.removeAllPoints()
        drawViews.layer.sublayers = nil
        drawViews.setNeedsDisplay()
    }
    
    ///點擊橡皮擦->畫筆變成白色(橡皮擦效果)
    @objc func eraserBtnClick() {
        drawViews.lineColor = UIColor.white.cgColor
        toolbarViews.lineWidthSlider.tintColor = UIColor.white
        toolbarViews.eraserBtn.isEnabled = false
        for i in 0..<mBtnArray.count {
            mBtnArray[i].alpha = 1
        }
    }
    
    ///時間到或按完成時的方法
    @objc func completeAndTimeup() {
        self.views.timeUpView.isHidden = false
        self.drawViews.canDrow = false
        let renderer = UIGraphicsImageRenderer(size: self.drawViews.bounds.size)
        //將view轉成image
        let image = renderer.image(actions: { (context) in
            self.drawViews.drawHierarchy(in: self.drawViews.bounds, afterScreenUpdates: true)
        })
        let vc = self.views.loadGuestViewController(image: image, anser: mModels, playerCount: mPlayerCount)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.present(vc, animated: true, completion: nil)
        }
        
        self.views.questionTitle.text = "题目： "
        self.mGameTimer?.invalidate()
        self.mGameTimer = nil
    }
}
