//
//  DetailViewController.swift
//  Guide
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 scut. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
 
    @IBOutlet weak var descriptionText: UITextField!
    
    var foodForEdit: Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = foodForEdit?.name
        self.descriptionText.text = foodForEdit?.description
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameEditDidEnd(_ sender: Any) {
        foodForEdit?.name = name.text
    }
    
    @IBAction func descriptionEditDidEnd(_ sender: Any) {
        foodForEdit?.description = descriptionText.text
    }
    
    
    @IBAction func nameValueChanged(_ sender: Any) {
        foodForEdit?.name = name.text
    }
    
    @IBAction func descriptionValueChanged(_ sender: Any) {
        foodForEdit?.description = descriptionText.text
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            foodForEdit = Food(name: name.text, description: descriptionText.text)
        }
    }
    

}