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
    }
    
    @IBAction func Apply(_ sender: Any) {
        guard let lvc = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        
        lvc.idvalue = emailTextField.text
        lvc.pwvalue = pwTextField.text
        
        self.present(lvc, animated: true, completion: {
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
}
