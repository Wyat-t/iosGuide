//
//  ViewController.swift
//  Guide
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 scut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phone.delegate = self as? UITextFieldDelegate
    }
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func phoneAction(_ sender: UITextField, forEvent event: UIEvent) {
        if(phone.text=="123") {phone.text="456"}
        phone.clearButtonMode = UITextField.ViewMode.always
    }
    
    @IBAction func confirmTouchUp(_ sender: UIButton) {
        nameLabel.text = phone.text
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //phone.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //phone.endEditing(true)
    }
    
}

