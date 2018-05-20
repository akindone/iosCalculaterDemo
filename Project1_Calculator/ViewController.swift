//
//  ViewController.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardButtonInputDelegate {
    let board = Board()
    let screen = Screen()
    let calculator = CalculatorEngine()
    var isNew = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(board)
        self.view.addSubview(screen)
        board.delegate = self
        board.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.bottom.equalTo(0)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
        }
        
        
        
        screen.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func boardButtonClick(content: String) {
        if content == "AC" || content == "Del" || content == "="{

            switch content {
            case "AC":
                screen.clearContent()
                screen.refreshHistory()
            case "Del":
                screen.deleteInput()
            case "=":
                let result = calculator.calculateEquation(equation: screen.inputString)
                screen.refreshHistory()
                screen.clearContent()
                screen.inputContent(content: String(result))
                isNew = true
            default:
                screen.refreshHistory()
            }
        }else{
            if isNew {
                screen.clearContent()
                isNew = false
            }
            screen.inputContent(content: content)
        }
    }

}

