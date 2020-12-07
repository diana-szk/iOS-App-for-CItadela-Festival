//
//  MessageTableViewCell.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/11/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageDesign: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //rotunjim colturile layer-ului de mesaje
        messageDesign.layer.cornerRadius = messageDesign.frame.size.height / 5
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
