//
//  Screen.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit
import SnapKit

class Screen: UIView {
    
    var inputLabel: UILabel?
    var historyLabel: UILabel?
    var inputString = ""{
        didSet {
            inputLabel?.text = inputString
        }
    }
    var historyString = ""{
        didSet {
            historyLabel?.text = historyString
        }
    }
    
    init(){
        inputLabel = UILabel()
        historyLabel = UILabel()
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        inputLabel?.font = UIFont.systemFont(ofSize: 34)
        historyLabel?.font = UIFont.systemFont(ofSize: 30)
        inputLabel?.textColor = UIColor.orange
        historyLabel?.textColor = UIColor.black
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0
        
        self.addSubview(inputLabel!)
        self.addSubview(historyLabel!)
        
        inputLabel?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.bottom.equalToSuperview().offset(-10)
            maker.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
        historyLabel?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.top.equalToSuperview()
            maker.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
    }

}
