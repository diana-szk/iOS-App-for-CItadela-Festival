//
//  StagesViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/1/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class StagesViewController: UIViewController{
    
    @IBOutlet weak var stagesTableView: UITableView!
    
    var daysArray = ["day1", "day2", "day3", "day4"]
    var dateArray = ["Thursday", "Friday", "Saturday", "Sunday"]
    var timetableArray = ["Thursday", "Friday", "Saturday", "Sunday"]
    var selectedIndex = -1
    var collapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stagesTableView.delegate = self
        stagesTableView.dataSource = self
        stagesTableView.estimatedRowHeight = 446
        stagesTableView.rowHeight = UITableView.automaticDimension
    }
}

extension StagesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stagesTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellIdentifier) as! StagesTableViewCell
        cell.dayImage.image = UIImage(named: "\(daysArray[indexPath.row])")
        cell.dateLabel.text! = dateArray[indexPath.row]
        cell.timetableImage.image = UIImage(named: "\(timetableArray[indexPath.row])")
        return cell
    }
}

extension StagesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //stabilim daca este selectata celula
        if self.selectedIndex == indexPath.row && collapse == true{
            //daca este selectata va avea dimensiunea 446
            return 446
        }else{
            //daca nu e selectata va avea dimensiunea de 150
            return 150
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //daca este selectata se expandeaza
        if selectedIndex == indexPath.row{
            //daca o celula este deschisa, iar alta este apasata, celula deschisa se va inchide si cealalta se va deschide
            if self.collapse == false{
                self.collapse = true
            }else{
                self.collapse = false
            }
            //daca nu e selectata revine la normal
        }else{
            self.collapse = true
        }
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
