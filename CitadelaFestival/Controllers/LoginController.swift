//
//  LoginController.swift
//  CitadelaFestival
//
//  Created by Mayana on 5/25/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpObjects()
    }
    
    func setUpObjects(){
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
        
    }
    
    func validateField() -> String? {
        
        //verificam sa avem complete campurile
        
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Fill all the fields!"
        }
        
        //verificam daca parola este buna
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password) == false {
            //parola nu e securizata
            return "Your password need to be at least 8 characters, contains a number and a special character!"
        }
        
        return nil
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        //validam campuri
        let err = validateField()
        
        if err != nil {
            
            //error message
            showError(err!)
            
        }else{
            //date ok
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //sign in
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error{
                    //nu s-a facut sign in
                    self.errorLabel.text = error.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    //daca a reusit conectarea utilizatorului, se va face tranzitia catre Home
                    self.transitionToHome()
                }
                
            }
            
        }
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){

        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
    
    
}

