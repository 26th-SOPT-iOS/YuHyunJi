//
//  DetailViewController.swift
//  Thirdweek_Seminar
//
//  Created by hjyoo on 2020/05/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }
    
}
