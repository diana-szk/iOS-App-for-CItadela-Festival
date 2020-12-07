//
//  FoodViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/2/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController{
    
    var restaurantName = ["Asalt Burgers", "DaFud Dudes", "Clatite", "Cofferize"]
    var restaurantImages = ["asalt", "dafud", "clatite", "coffee"]
    var restaurantDescription = ["Prezenti la multe festivaluri, cei de la Asalt Burger continua sa ne incante de fiecare data. Iti face si tie ceva cu ochiul?", "O caravana colorata cu oameni veseli, nu ai cum sa treci pe langa si sa nu-i observi.Merita sa degusti si delicatesele preparte de ei.", "Ceva dulce nu strica niciodata, asa ca am pregatit pentru voi food truck-ul cu Clatite. Nu-i asa ca suna bine?", "Nu, bineinteles ca nu am uitat de cafea. Stim cat de bine merge o cafea dimineata la rasarit, iar cei de la Cofferize ne sunt alaturi sa o prepare proaspata pentru noi."]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

}

extension FoodViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //determinam numarul de randuri din tabel
        return restaurantName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cream celula reutilizabila cu ajutorul identificatorului
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FoodTableViewCell
         //populam celula cu numele restaurantelor
        cell.restaurantName.text! = restaurantName[indexPath.row]
        //populam celula cu imaginile restaurantelor
        cell.restaurantImage.image = UIImage(named: "\(restaurantImages[indexPath.row])")
        //populam celula cu descrierea restaurantelor
        cell.restaurantDescription.text! = restaurantDescription[indexPath.row]
        return cell
    }
    
}


