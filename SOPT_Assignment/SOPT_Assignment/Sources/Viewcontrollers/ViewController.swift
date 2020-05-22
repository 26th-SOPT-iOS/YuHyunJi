//
//  ViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit
import BEMCheckBox

class ViewController: UIViewController, BEMCheckBoxDelegate {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    
    @IBOutlet weak var emailTextview: UIView!
    @IBOutlet weak var pwTextview: UIView!
    
    @IBOutlet weak var autologinButton: UIButton!
    
    var id: String?
    var pw: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        emailTextview.layer.cornerRadius = 22
        pwTextview.layer.cornerRadius = 22
        
        setLabels()
        //autologinButton.delegate = self
        //autoLoginCheck()
    }
    
    func setLabels() {
        guard let id = self.id else { return }
        guard let pw = self.pw else { return }
        
        emailTextfield.text = id
        pwTextfield.text = pw
    }
    
    func autoLoginCheck(){
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.autoLoginCheck) {
            print("auto login checked")
            if let tabbarController = self.storyboard?.instantiateViewController(identifier:
                "customTabbarController") as? UITabBarController {
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func autoLoginAction(_ sender: UIButton) {
        // auto login 선택 여부
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true {
            sender.tintColor = UIColor.systemBlue
        }
        else{
            sender.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func login(_ sender: Any) {
        /*
         guard let ovc = self.storyboard?.instantiateViewController(identifier: "oursoptViewController") as? OursoptViewController else {return}
         
         self.present(ovc, animated: true, completion: { self.navigationController?.popToRootViewController(animated: false
         )}
         )
         */
        //입력값 저장
        guard let inputID = emailTextfield.text else { return }
        guard let inputPWD = pwTextfield.text else { return }
        
        //미리 정의해 둔 싱글톤 객체 통해 데이터 통신
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            //네트워크 통신 결과에 따른 VC 내의 분기처리
            case .success(let token):
                /*
                 if self.autologinButton.isSelected {
                 UserDefaults.standard.set(true, forKey: UserDefaultKeys.autoLoginCheck)
                 }*/
                guard let token = token as? String else { return }
                //UserDefaults = iOS 내부 DB 에 토큰값 넣어주기
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            //로그인 실패
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    
    @IBAction func apply(_ sender: Any) {
        let avc = self.storyboard?.instantiateViewController(identifier: "applyViewController") as! ApplyViewController
        self.navigationController?.pushViewController(avc, animated: true)
    }
}


