//
//  ViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    
    @IBOutlet weak var emailTextview: UIView!
    @IBOutlet weak var pwTextview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        emailTextview.layer.cornerRadius = 22
        pwTextview.layer.cornerRadius = 22
        
    }

    @IBAction func login(_ sender: Any) {
        guard let ovc = self.storyboard?.instantiateViewController(identifier: "oursoptViewController") as? OursoptViewController else {return}
        
        self.present(ovc, animated: true, completion: { self.navigationController?.popToRootViewController(animated: false
            )}
        )
    }
    
    @IBAction func apply(_ sender: Any) {
        let avc = self.storyboard?.instantiateViewController(identifier: "applyViewController") as! ApplyViewController
        self.navigationController?.pushViewController(avc, animated: true)
    }
}

