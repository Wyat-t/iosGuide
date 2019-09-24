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
        //let initView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        let initView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        initView.backgroundColor = UIColor.white
        self.view = initView
        let secondView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        secondView.backgroundColor = UIColor.blue
        //self.view.addSubview(secondView)
        initView.addSubview(secondView)
        UIView.animate(withDuration: 1){
            var trans = secondView.transform
            trans = trans.translatedBy(x: 100, y: 700)
            secondView.transform = trans
        }
    }


}

