//
//  LoginViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    //내부에선 아울렛변수를 참조할 수 없어 만들어줌
    var idvalue: String?
    var pwvalue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    @IBAction func logOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabels() {
        guard let idvalue = idvalue.self else {return}
        guard let pwvalue = pwvalue.self else {return}
        
        id.text = idvalue
        pw.text = pwvalue
    }

}

