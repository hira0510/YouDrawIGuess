//
//  CustomWordView.swift
//  YouDrawIGuess
//
//  Created by  on 2021/9/22.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

class CustomWordView: UIView {
    
    @IBOutlet var mView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var mTextField: UITextField!
    
    var clickRemoveBtnHandler: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomWordView", owner: self, options: nil)
        addSubview(mView!)
        mView.translatesAutoresizingMaskIntoConstraints = false
        mView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bgView.layer.cornerRadius = 10
        mTextField.delegate = self
        clickButton.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
    }
    
    /// 點擊關閉按鈕
    @objc private func didClickButton() {
        guard let text = mTextField.text, text != "" else { return }
        clickRemoveBtnHandler?(text)
        self.removeFromSuperview()
    }
}


extension CustomWordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        didClickButton()
        return true
    }
}
