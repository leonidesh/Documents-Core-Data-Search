//
//  TableViewCell.swift
//  DocumentsChallenge
//
//  Created by 刘洋 on 6/15/19.
//  Copyright © 2019 Yang Liu. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
