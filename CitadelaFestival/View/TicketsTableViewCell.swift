//
//  TicketsTableViewCell.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/2/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class TicketsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageInfo: UIImageView!
    @IBOutlet weak var nameInfo: UILabel!
    @IBOutlet weak var descriptionInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupObjects()
    }
    
    func setupObjects(){
        Utilities.bottomLineCLabel(nameInfo)
    }
    
}
