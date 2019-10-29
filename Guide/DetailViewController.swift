//
//  DetailViewController.swift
//  Guide
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 scut. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var name: UITextField!
 
    @IBOutlet weak var descriptionText: UITextField!
    
    @IBOutlet weak var foodAvatar: UIImageView!
    
    var foodForEdit: Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = foodForEdit?.name
        self.descriptionText.text = foodForEdit?.foodDescription
        self.foodAvatar.image = foodForEdit?.foodAvatar
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodAvatar.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            foodForEdit = Food(name: name.text, foodDescription: descriptionText.text, foodAvatar: foodAvatar.image)
        }
    }
    

}
