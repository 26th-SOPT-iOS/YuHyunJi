//
//  ApplyViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ApplyViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Apply(_ sender: Any) {
        guard let lvc = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        
        lvc.idvalue = idTextField.text
        lvc.pwvalue = pwTextField.text
        
        self.present(lvc, animated: true, completion: {
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
}
