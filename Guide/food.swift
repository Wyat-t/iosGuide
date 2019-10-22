//
//  food.swift
//  Guide
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 scut. All rights reserved.
//

import Foundation

class Food: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription = aDecoder.decodeObject(forKey: "descriptionKey") as? String
    }
    
    var name: String?
    var foodDescription: String?
    init(name: String?, foodDescription: String?) {
        self.name = name
        self.foodDescription = foodDescription
    }
    
    //add document path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
}
