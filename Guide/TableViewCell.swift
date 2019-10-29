//
//  TableViewCell.swift
//  Guide
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 scut. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var foodAvatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
