//
//  SignUpViewController.swift
//  CitadelaFestival
//
//  Created by Diana on 5/25/20.
//  Copyright © 2020 Diana. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpObjects()
    }
    
    func setUpObjects(){
        
        // ascundem label-ul eroare
        errorLabel.alpha = 0
        
        //Stizilam obiectele
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }
    
    //verificam campurile si validam datele. Daca sunt corecte, metoda o sa returneze nil, iar daca nu, o sa returneze o eroare
    func validateField() -> String? {
        
        //verificam sa avem complete campurile
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
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
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        //validam campuri
        let error = validateField()
        
        if error != nil {
            //error message
            showError(error!)
        }
        else{
            //date bune 
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //cream user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //verficam erori
                if err != nil {
                    //Eroare
                    self.showError("Error creating the user.")
                }else{
                    //User-ul a fost creat cu succes
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            //arata eroarea
                            self.showError("Error saving user data")
                        }
                    }
                    //tranzitie home
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
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}

