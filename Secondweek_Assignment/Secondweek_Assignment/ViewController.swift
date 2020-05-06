//
//  ViewController.swift
//  Secondweek_Assignment
//
//  Created by hjyoo on 2020/04/30.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
    }
    
    var displayText: String = "0"//클릭된 '숫자'
    var prevSign: String = "+" //클릭된 '연산기호'
    var prev: Int = 0 //값저장소
    var current: Int = 0 //현재누른값

    //displayLabel.text될 숫자 및 displayText 정의
    @IBAction func btnNumberClick(btn: UIButton) {
        if displayLabel.text == "0" {
            displayText = (btn.titleLabel?.text)!
        }
        else {
            displayText += (btn.titleLabel!.text)!
        }
        displayLabel.text = displayText
    }
    
    //AC(리셋) 기능 정의
    @IBAction func btnResetClick(btn: UIButton) {
        displayText = "0"
        displayLabel.text = displayText
        prev = 0
        current = 0
    }
    
    //연산 기능 정의
    @IBAction func operation(sign: UIButton) {
        if displayText != "" {
            if sign.titleLabel!.text! == "+"{
                preOperation()
            }
            else if sign.titleLabel!.text! == "−" {
                preOperation()
            }
            else if sign.titleLabel!.text! == "×" {
                preOperation()
            }
            else if sign.titleLabel!.text! == "÷" {
                preOperation()
            }
            else if sign.titleLabel!.text! == "=" {
                preOperation()
                displayLabel.text = String(prev)
                prev = 0
            }
            prevSign = sign.titleLabel!.text!
            displayText = ""
        }
    }

    //연산함수
    func preOperation() {
        if prev == 0 {
            prev = Int(displayText)!
        }
        else {
            current = Int(displayText)!
            if prevSign == "+" {
                prev += current
                displayLabel.text = String(prev)
            }
            else if prevSign == "−" {
                prev -= current
                displayLabel.text = String(prev)
            }
            else if prevSign == "×" {
                prev *= current
                displayLabel.text = String(prev)
            }
            else if prevSign == "÷" {
                prev /= current
                displayLabel.text = String(prev)
            }
        }
    }
}

