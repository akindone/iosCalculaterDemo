//
//  ViewController.swift
//  Project1_Calculator
//
//  Created by jike on 2018/1/10.
//  Copyright © 2018年 jike. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController, BoardButtonInputDelegate {
    let board = Board()
    let screen = Screen()
    let calculator = CalculatorEngine()
    private var disposeBag = DisposeBag()
    let viewModel: CalculatorViewModel = CalculatorViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(board)
        self.view.addSubview(screen)
        board.delegate = self
        board.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.bottom.equalTo(0)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2 / 3.0)
        }

        screen.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        }
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.rxInput.asObservable().subscribe(onNext: {
            print("ViewController bindViewModel \($0)")
            self.screen.inputString = $0
        }).disposed(by: disposeBag)
        viewModel.rxHistory.asObservable().subscribe(onNext: {
            self.screen.historyString = $0
        }).disposed(by: disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func boardButtonClick(content: String) {
        viewModel.onBoardClickAction(content: content)
    }

}

