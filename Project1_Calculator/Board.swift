//
//  Board.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit
import SnapKit

class Board: UIView {
    var delegate: BoardButtonInputDelegate?
    
    var dataArray = [
        "0",".","%","=",
        "1","2","3","+",
        "4","5","6","-",
        "7","8","9","*",
        "AC", "Delete", "^", "/"
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){
        var frontBtn: FuncButton!
        for index in 0..<20{
            let btn = FuncButton()
            self.addSubview(btn)
            btn.snp.makeConstraints({ (maker) in
                if index%4 == 0 { //0,1,4,7,ac
                    maker.left.equalTo(0)
                } else {
                    maker.left.equalTo(frontBtn.snp.right)
                }
                
                if index/4 == 0 { //0,.,%,=
                    maker.bottom.equalTo(0)
                } else if index%4 == 0 {
                    maker.bottom.equalTo(frontBtn.snp.top)//上一个控件的顶部
                } else {
                    maker.bottom.equalTo(frontBtn.snp.bottom)//上一个控件的底部
                }
                maker.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25) // 宽度为父视图宽度的0.25
                maker.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
                
                
            })
            btn.tag = index + 1000
            btn.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
            btn.setTitle(dataArray[index], for: UIControlState.normal)
            frontBtn = btn
            
        }
        
    }
    
    @objc func onClickButton(btn: FuncButton){
        print(btn.tag)
        let index = btn.tag - 1000
        delegate?.boardButtonClick(content: dataArray[index])
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

protocol BoardButtonInputDelegate {
    func boardButtonClick(content: String)
}
