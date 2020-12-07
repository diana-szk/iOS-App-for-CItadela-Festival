//
//  FoodTableViewCell.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/2/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupObjects()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setupObjects(){
        Utilities.bottomLineCLabel(restaurantName)
    }
    
    
}
