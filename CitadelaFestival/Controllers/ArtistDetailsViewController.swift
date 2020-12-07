//
//  ArtistDetailsViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 5/26/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class ArtistDetailsViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    
    var name = ""
    var image = UIImage()
    var desc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(false, animated: false)
        img.image = image
        lbl1.text = desc
       setUpObjects()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBackButton(_ sender: UIButton) {
    
        dismiss(animated: true, completion: nil)
        
    }
    
    func setUpObjects(){
        Utilities.styleHollowButton(backButton)
    }
}
