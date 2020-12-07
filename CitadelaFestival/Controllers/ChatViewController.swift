//
//  ChatViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/11/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //pentru a putea folosi celula din fisierul XIB, trebuie inregistrata in tabel
        tableView.register(UINib(nibName: Constants.Cell.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.Cell.cellIdentifier)
        loadMessages()
        
    }
    
    func loadMessages(){
        
        //retragem datele curente din baza de date
        db.collection(Constants.Firebase.collectionName)
            
            //ordonam mesajele dupa data
            .order(by: Constants.Firebase.dateField)
            
            //adaugam snapshot pentru a putea prelua documentele
            .addSnapshotListener { (querySnapshot, error) in
                self.messages = []
                
                if let e = error{
                    print("Eroare la extragerea datelor din baza de date \(e)")
                }else{
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            
                            //stocam datele preluate din fiecare document si cream cele 2 proprietati ale mesajului
                            let data = doc.data()
                            if let messageSender = data[Constants.Firebase.senderField] as? String,
                                let messageBody = data[Constants.Firebase.bodyField] as? String{
                                
                                //cream obiectul structurandu-l in cele 2 parti
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                
                                //populam array-ul cu mesaje
                                self.messages.append(newMessage)
                                
                            //fir principal
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
        }
    }
    
    
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextField.text,
            
            //daca vom avea un user curent, ii vom prelua email-ul si va si stocat in constanta creata
            let messageSender = Auth.auth().currentUser?.email{
            
            // trimiterea datelor catre Firestore
            db.collection(Constants.Firebase.collectionName).addDocument(data:
                [Constants.Firebase.senderField: messageSender,
                 Constants.Firebase.bodyField: messageBody,
                 Constants.Firebase.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error{
                    print("Datele nu au fost salvate in baza de date \(e)")
                }else{
                    print("Succes")
                    DispatchQueue.main.async {
                        self.messageTextField.text = ""
                    }
                    
                }
            }
        }
    }
    
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        transitionToHome()
    }
    
    func transitionToHome(){
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}



extension ChatViewController: UITableViewDataSource{
    //se returneaza numarul de randuri
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        //cream celula reutilizabila cu ajutorul identificatorului
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageTableViewCell
        //populam celula cu numele utilizatorului si mesajul trimis de el
        cell.label.text = String("\(message.sender): \(message.body)")
        
        //mesaj de la user-ul curent
        if message.sender == Auth.auth().currentUser?.email{
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
            cell.messageDesign.backgroundColor = UIColor(named: Constants.Cell.lightColor)
        }
            //mesaj de la alt user
        else{
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
            cell.messageDesign.backgroundColor = UIColor(named: Constants.Cell.darkColor)
        }
        return cell
    }
    
}


