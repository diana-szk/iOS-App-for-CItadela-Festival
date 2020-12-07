//
//  HomeViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 5/25/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleHollowButton(logOut)
        
    }
    
    @IBAction func artistPressed(_ sender: UIButton) {
        //se face tranzitia catre ArtistViewController
        self.performSegue(withIdentifier: Constants.Storyboard.artistViewController, sender: self)
    }
   
    
    @IBAction func stagesPressed(_ sender: UIButton) {
         //se face tranzitia catre StagesViewController
        self.performSegue(withIdentifier: Constants.Storyboard.stagesViewController, sender: self)
    }
    
    @IBAction func foodPressed(_ sender: UIButton) {
        //se face tranzitia catre FoodViewController
        self.performSegue(withIdentifier: Constants.Storyboard.foodViewController, sender: self)
    }
    
    @IBAction func ticketsPressed(_ sender: UIButton) {
        //se face tranzitia catre TicketsViewController
        self.performSegue(withIdentifier: Constants.Storyboard.ticketsViewController, sender: self)
    }
    
    @IBAction func chatPressed(_ sender: UIButton) {
        transitionToChat()
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        do{
            //deconectare user
            try Auth.auth().signOut()
            
            //tranzitie catre ViewController
            transitionToFirst()
            
        } catch let signOutError as NSError{
            
            //eroare
            print("Error signing out: %@", signOutError)
        }
    }
    
    func transitionToFirst(){
        
        let firstViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.firstViewController) as? ViewController
        self.view.window?.rootViewController = firstViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func transitionToChat(){
           
           let chatViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.chatViewController) as? ChatViewController
           
           view.window?.rootViewController = chatViewController
           view.window?.makeKeyAndVisible()
       }
     
    
     
}
