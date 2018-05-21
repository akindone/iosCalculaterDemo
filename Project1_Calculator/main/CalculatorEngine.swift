//
//  CalculatorEngine.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit

class CalculatorEngine: NSObject {
    let funcArray:CharacterSet = ["+","-","*","/","^","%"]
    func calculateEquation(equation:String) -> Double {
        let elementArray = equation.components(separatedBy: funcArray)
        var tip = 0
        var result:Double = Double(elementArray[0])!
        print("CalculatorEngine", equation, elementArray)
        for char in equation {
            switch char {
            case "+":
                tip += 1
                if elementArray.count>tip {
                    result+=Double(elementArray[tip])!
                }
            case "-":
                tip += 1
                if elementArray.count>tip {
                    result-=Double(elementArray[tip])!
                }
            case "*":
                tip += 1
                if elementArray.count>tip {
                    result*=Double(elementArray[tip])!
                }
            case "/":
                tip += 1
                if elementArray.count>tip {
                    result/=Double(elementArray[tip])!
                }
            case "%":
                tip += 1
                if elementArray.count>tip {
                    result+=Double(Int(result)%Int(elementArray[tip])!)
                }
            case "^":
                tip += 1
                if elementArray.count>tip {
                    let tmp = result
                    for _ in 1..<Int(elementArray[tip])! {
                        result *= tmp
                    }
                }

            default:
                break
            }
        }
        print("CalculatorEngine result", result)
        return result
    }

}
