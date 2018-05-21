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
//    let figureArray: Array<Character> = [
//        "0","1","2","3","4","5","6","7","8","9","."
//    ]
//    let funcArray: Array<Character> = [
//        "+","-","*","/","%","^"
//    ]
    
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

//    func deleteInput() {
//        if inputString.count>0 {
//            inputString.remove(at: inputString.index(before:inputString.endIndex))
//            inputLabel?.text = inputString
//        }
//    }

//    func inputContent(content: String){
//        let char = content.characters.last!
////        print("Screen", "last = \(char)", "inputString = \(inputString)")
//        if !figureArray.contains(char) && !funcArray.contains(char){
//            return
//        }
//        if inputString.characters.count > 0 {// 非第一个输入
//            let lastInputChar = inputString.characters.last!
//            if lastInputChar == "." && char == "."{
//                return
//            }
//            if figureArray.contains(lastInputChar) || figureArray.contains(char){ // 上一个字符是数字 或者 这个字符是数字，可以输入; 如果上一个是运算符且这个还是运算符就不走下面的代码
//                inputString.append(char)
//                inputLabel?.text = inputString
//            }
//        } else {// 第一个输入
//            if figureArray.contains(char){
//                inputString.append(content)
//                inputLabel?.text = inputString
//            }
//        }
//    }
    
//    func refreshHistory(){
//        historyString = inputString
//        historyLabel?.text = historyString
//    }
    
//    func clearContent(){
//        inputString = ""
//    }
    
//    func delInput(){// 回删1个字符
//        if inputString.characters.count > 0{
//            inputString.removeLast()
//            inputLabel?.text = inputString
//        }
//    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
