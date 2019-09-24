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
    }
    @IBOutlet weak var phone: UITextField!
    
    @IBAction func phoneAction(_ sender: UITextField, forEvent event: UIEvent) {
        if(phone.text=="123") {phone.text="456"}
        phone.clearButtonMode = UITextField.ViewMode.always
        
    }
    
    
}

