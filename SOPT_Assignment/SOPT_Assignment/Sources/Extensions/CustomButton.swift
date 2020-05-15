//
//  CustomButton.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/22.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //값이 커질수록 둥글
        self.layer.cornerRadius = 0.08 * self.bounds.size.width
        //버튼 배경색
        self.backgroundColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1)
        //버튼의 textcolor
        self.tintColor = UIColor.white
        //버튼 text 굵기 및 크기
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //버튼의 외곽선컬러
        //self.layer.borderColor =
        //버튼의 외곽선두께: 값이 커질수록 두꺼움
        //self.layer.borderWidth =

    }
}
