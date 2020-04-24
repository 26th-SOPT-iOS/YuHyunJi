//
//  FirstViewController.swift
//  Firstweek_Seminar
//
//  Created by hjyoo on 2020/04/18.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var sampleSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func transferData(_ sender: Any) {
        
        guard let receiveController = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else { return }
        
        receiveController.name = nameTextfield.text
        receiveController.email = emailTextfield.text
        receiveController.isOnoff = sampleSwitch.isOn
        receiveController.frequency = sampleSlider.value
        
        //코드로 뷰간의 present연결 (이때,스토리보드에선 뷰간 연결해주면 안됨)
        self.present(receiveController, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
