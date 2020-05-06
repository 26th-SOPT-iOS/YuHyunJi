//
//  CustomButton.swift
//  Secondweek_Assignment
//
//  Created by hjyoo on 2020/04/30.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //값이 커질수록 둥글
        self.layer.cornerRadius = self.layer.frame.size.height * 0.46
        //버튼 배경색
        //self.backgroundColor = UIColor(red: 8/255, green: 37/255, blue: 108/255, alpha: 1)
        //버튼의 textcolor
        //self.tintColor = UIColor.white
        //버튼 text 굵기 및 크기
        //self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //버튼의 외곽선컬러
        //self.layer.borderColor =
        //버튼의 외곽선두께: 값이 커질수록 두꺼움
        //self.layer.borderWidth =

    }
}
