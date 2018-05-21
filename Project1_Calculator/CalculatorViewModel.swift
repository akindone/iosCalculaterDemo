//
// Created by jike on 2018/5/20.
// Copyright (c) 2018 jike. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CalculatorViewModel {
    var rxInput: Variable<String> = Variable("")
    var rxHistory: Variable<String> = Variable("")

    private var inputString: String {
        get {
            return rxInput.value
        }
        set {
            rxInput.value = newValue
        }
    }
    private var historyString: String {
        get {
            return rxHistory.value
        }
        set {
            rxHistory.value = newValue
        }
    }

    private let calculator = CalculatorEngine()

    private let figureArray: Array<Character> = [
        "0","1","2","3","4","5","6","7","8","9","."
    ]
    private let funcArray: Array<Character> = [
        "+","-","*","/","%","^"
    ]

    func onBoardClickAction(content: String) {
        switch content {
        case "AC":
            inputString = ""
            historyString = inputString
        case "Del":
            if inputString.characters.count > 0{
                inputString.removeLast()
            }
        case "=":
            let result = calculator.calculateEquation(equation: inputString)
            historyString = inputString
            inputString = String(result)
        default:
            inputContent(content: content)
        }
    }

    private func inputContent(content: String){
        print("CalculatorViewModel inputContent \(content)")
        let char = content.characters.last!
//        print("Screen", "last = \(char)", "inputString = \(inputString)")
        if !figureArray.contains(char) && !funcArray.contains(char){
            return
        }
        if inputString.characters.count > 0 {// 非第一个输入
            let lastInputChar = inputString.characters.last!
            if lastInputChar == "." && char == "."{
                return
            }
            if figureArray.contains(lastInputChar) || figureArray.contains(char){ // 上一个字符是数字 或者 这个字符是数字，可以输入; 如果上一个是运算符且这个还是运算符就不走下面的代码
                inputString.append(char)
            }
        } else {// 第一个输入
            inputString.append(content)
        }
    }

}
