//
//  TableViewCell.swift
//  AlmofireDemo1
//
//  Created by Asmita on 16/12/17.
//  Copyright © 2017 Asmita. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var home: UILabel!
    @IBOutlet var office: UILabel!
    @IBOutlet var mobile: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
