//
//  FuncButton.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit

class FuncButton: UIButton {
    init() {
        super.init(frame: CGRect.zero) // 要使用AutoLayout，这里设置为0，0，0，0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha:1).cgColor
        // set font; set color
        self.setTitleColor(UIColor.orange, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
