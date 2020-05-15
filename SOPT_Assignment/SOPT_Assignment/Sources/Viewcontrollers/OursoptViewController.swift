//
//  OursoptViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/05/01.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class OursoptViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImgViewHeight: NSLayoutConstraint!
    
    let scrollTopEdgeInsets: CGFloat = 210
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition < 0 {
            headerImgViewHeight.constant = scrollTopEdgeInsets - yPosition
        } else {
            print(scrollTopEdgeInsets - yPosition)
            if scrollTopEdgeInsets - yPosition > 105 {
                headerImgViewHeight.constant = scrollTopEdgeInsets - yPosition
            } else {
                headerImgViewHeight.constant = 105
                
            }
        }
    }
    
 
}
