//
//  ViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        guard let lvc = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        
        lvc.idvalue = idTextfield.text
        lvc.pwvalue = pwTextfield.text
        self.present(lvc, animated: true, completion: nil)
    }
    
    @IBAction func apply(_ sender: Any) {
        let avc = self.storyboard?.instantiateViewController(identifier: "applyViewController") as! ApplyViewController
        self.navigationController?.pushViewController(avc, animated: true)
    }
}

