//
//  ArtistTableViewCell.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/3/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
}
