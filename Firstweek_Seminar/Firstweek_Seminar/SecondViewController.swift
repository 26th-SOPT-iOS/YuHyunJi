//
//  SecondViewController.swift
//  Firstweek_Seminar
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    //내부에선 아울렛변수를 참조할 수 없어 만들어줌
    var name: String?
    var email: String?
    var isOnoff: Bool?
    var frequency: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
      
    }
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabels() {
        guard let name = name.self else {return}
        guard let email = email.self else {return}
        guard let isOnoff = isOnoff.self else {return}
        guard let frequency = frequency.self else {return}
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnoff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
        
    }

}
