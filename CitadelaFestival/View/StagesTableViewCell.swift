//
//  StagesTableViewCell.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/1/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class StagesTableViewCell: UITableViewCell {
    @IBOutlet weak var dayImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timetableImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
