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
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var idTextView: UIView!
    @IBOutlet weak var phoneTextView: UIView!
    @IBOutlet weak var nameTextView: UIView!
    @IBOutlet weak var emailTextView: UIView!
    @IBOutlet weak var pwTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextView.layer.cornerRadius = 22
        phoneTextView.layer.cornerRadius = 22
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
        /*
         guard let ovc = self.storyboard?.instantiateViewController(identifier: "oursoptViewController") as? OursoptViewController else {return}
         
         self.present(ovc, animated: true, completion: { self.navigationController?.popToRootViewController(animated: false
         )})*/
        //입력값 저장
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        guard let inputNAME = nameTextField.text else { return }
        guard let inputPHONE = phoneTextField.text else { return }
        guard let inputEMAIL = emailTextField.text else { return }
        
        //미리 정의해 둔 싱글톤 객체 통해 데이터 통신
        SignupService.shared.signup(inputID, inputPWD, inputNAME, inputEMAIL, inputPHONE) { networkResult in
            switch networkResult {
            case .success:
                LoginService.shared.login(id: inputID, pwd: inputPWD) {
                    networkResult in
                    switch networkResult {
                    // 회원가입 성공
                    case .success:
                        guard let viewcontroller = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else { return }
                        viewcontroller.id = inputID
                        viewcontroller.pw = inputPWD
                        //로그인 뷰로 전환
                        self.navigationController?.show(viewcontroller, sender: self)
                        //self.navigationController?.popViewController(animated: true)
                        //탭바 뷰로 전환
                        guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                            "customTabbarController") as? UITabBarController else { return }
                        tabbarController.modalPresentationStyle = .fullScreen
                        self.present(tabbarController, animated: true, completion: nil)
                    case .requestErr(let message):
                        guard let message = message as? String else { return }
                        let alert = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    case .pathErr: print("path")
                    case .serverErr: print("serverErr")
                    case .networkFail: print("networkFail")
                    }
                }
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alert = UIAlertController(title: "회원가입 실패", message: message,  preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
}
