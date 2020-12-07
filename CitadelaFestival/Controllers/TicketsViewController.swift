//
//  TicketsViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/2/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController {
    
    var nameInfo = ["General Info", "Camping Info", "Tickets Info"]
    var imageInfo = ["ticketsinfo", "campinginfo", "ticketsprice"]
    var descriptionInfo = ["Ne bucuram ca ai ajuns pana aici. Dupa cum bine stii, festivalul va avea loc in perioada 23-26 Iulie, iar accesul in festival va fi disponibil de la ora 17:00. Accesul se va face cu telecabina, gratis, aceasta circuland non-stop.", "Camping-ul se afla situat la 10 m de Poarta I, foarte aproape de festival. Daca vrei sa te bucuri de natura zilele acestea, ia-ti cortul si hai, e gratis!", "Biletele Early Bird sunt disponibile si asteapta sa fie cumparate! Ele pot fi luate online(vezi butonul de jos), sau direct de la intrare, preturile fiind afisate mai sus. Te asteptam sa petreci cu noi clipe de vis!"]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ticketsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObjects()
    }
    
    @IBAction func ticketsPressed(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.livetickets.ro/bilete/citadela-festival-2020")! as URL, options: [:], completionHandler: nil)
               
    }
    
    func setupObjects(){
        Utilities.styleHollowButton(ticketsButton)
    }
    
}

extension TicketsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return nameInfo.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TicketsTableViewCell
           cell.nameInfo.text = nameInfo[indexPath.row]
           cell.imageInfo.image = UIImage(named: "\(imageInfo[indexPath.row])")
           cell.descriptionInfo.text = descriptionInfo[indexPath.row]
           cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
       
           return cell
          }
    
}

