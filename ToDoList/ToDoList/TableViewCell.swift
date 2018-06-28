//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Abai Kalikov on 6/28/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var event: UILabel!
    @IBOutlet weak var date: UILabel!
    
}
