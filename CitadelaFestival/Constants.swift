//
//  Constants.swift
//  
//
//  Created by Mayana on 6/11/20.
//

import Foundation

struct Constants{
    
    struct Storyboard {
        static let firstViewController = "firstVC"
        static let homeViewController = "HomeVC"
        static let artistViewController = "GoToArtist"
        static let stagesViewController = "GoToStages"
        static let foodViewController = "GoToFood"
        static let ticketsViewController = "GoToTickets"
        static let chatViewController = "ChatVC"
        
    }
    
    struct Cell {
        static let cellIdentifier = "cell"
        static let cellNibName = "MessageTableViewCell"
        static let lightColor = "BrandLightBlue"
        static let darkColor = "BrandBlue"
    }
    
    struct Firebase{
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

