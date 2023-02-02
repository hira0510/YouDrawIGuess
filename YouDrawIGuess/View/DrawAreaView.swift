//
//  DrawAreaView.swift
//  YouDrawIGuess
//
//  Created by  on 2020/1/31.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import CoreGraphics

class DrawAreaView: UIView {

    ///線的顏色
    var lineColor: CGColor = UIColor.lightGray.cgColor
    ///線的寬度
    var lineWidth: CGFloat = 10
    ///路徑
    var path: UIBezierPath!
    ///結束Point
    var touchPoint: CGPoint!
    ///開始Point
    var startingPoint: CGPoint!
    ///是否可以塗鴉
    var canDrow: Bool = true
    var swiped = false
    var lastPoint = CGPoint.zero

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startingPoint = touches.first?.location(in: self)
        touchPoint = startingPoint
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = touches.first?.location(in: self)
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        draw(candrow: canDrow)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = touches.first?.location(in: self)
    }
    
    /// 畫圖
    func draw(candrow: Bool) {
        if candrow == true {
            let shapeLayer = CAShapeLayer()
            path.close()
            shapeLayer.path = path.cgPath
            ///線條结尾的樣子
            shapeLayer.lineJoin = .round
            shapeLayer.strokeColor = lineColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.fillColor = UIColor.clear.cgColor
            self.layer.addSublayer(shapeLayer)
            self.setNeedsDisplay()
        }
    }
    
    /// 清除全部
    func clearCanvas() {
        if path != nil {
            path.removeAllPoints()
            self.layer.sublayers = nil
            self.setNeedsDisplay()
        }
    }
}
