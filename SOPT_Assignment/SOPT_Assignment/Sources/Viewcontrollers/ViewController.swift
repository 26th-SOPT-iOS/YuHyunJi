//
//  ViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit
import BEMCheckBox

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
    
    
    @IBAction func autoLoginAction(_ sender: UIButton) {
        // auto login 선택 여부
            sender.isSelected = !sender.isSelected
            if sender.isSelected == true{
                //isAutoLogin = true
            }else{
                //isAutoLogin = false
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
                guard let token = token as? String else { return }
                //UserDefaults = iOS 내부 DB 에 토큰값 넣어주기
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
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

