//
//  ApplyViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ApplyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var nameTextView: UIView!
    @IBOutlet weak var emailTextView: UIView!
    @IBOutlet weak var pwTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextView.layer.cornerRadius = 22
        emailTextView.layer.cornerRadius = 22
        pwTextView.layer.cornerRadius = 22
        
        navigationbarSetting()
    }
    
    func navigationbarSetting(){
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        // 네비게이션 바 backbutton custom
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1.0)
        self.navigationController?.navigationBar.topItem?.title = ""

    }
    
    
    @IBAction func Apply(_ sender: Any) {
        /*
        guard let lvc = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        
        lvc.idvalue = emailTextField.text
        lvc.pwvalue = pwTextField.text
        
        self.present(lvc, animated: true, completion: {
            self.navigationController?.popToRootViewController(animated: true)
        })
        */
        
        guard let ovc = self.storyboard?.instantiateViewController(identifier: "oursoptViewController") as? OursoptViewController else {return}
        
        self.present(ovc, animated: true, completion: { self.navigationController?.popToRootViewController(animated: false
        )})
    
    }

}
