//
//  CustomTableViewCell.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 07.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
