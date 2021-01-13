//
//  LoadingView.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import Lottie

class LoadingView: UIView {

    @IBOutlet var contentView: UIView!
    
    let kCONTENT_XIB_NAME = "LoadingView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        self.contentView.fixInView(self)
        self.tag = AppConstants.Logics.Tags.loadingIndicator
    }
    
    func loadAnimation() {
        let loadingView = AnimationView(name: "loading")
        loadingView.loopMode = .loop
        self.addSubview(loadingView)
        loadingView.frame = CGRect(x: self.center.x, y: self.center.y, width: 120, height: 120)
        loadingView.center = self.center
        loadingView.play()
    }
    
}
