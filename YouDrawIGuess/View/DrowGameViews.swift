//
//  DrowGameViews.swift
//  YouDrawIGuess
//
//  Created by  on 2020/2/3.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class DrowGameViews: NSObject {

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var timeUpView: UIView!

    ///載入猜題頁面
    func loadGuestViewController(image: UIImage, anser: String, playerCount: Int) -> GuestViewController {
        let vc = UIStoryboard.init(name: "DrawGuess", bundle: nil).instantiateViewController(withIdentifier: "GuestViewController") as! GuestViewController
        vc.mImageView = image
        vc.mTrueAnser = anser
        vc.mPlayerCount = playerCount
        return vc
    }
}
