//
//  ViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 5/25/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit
import AVKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpObjects()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
        
    func setUpObjects(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
    }
    
    func setUpVideo(){
        //cream path-ul pentru fisierul video
      let bundlePath = Bundle.main.path(forResource: "first", ofType: "mp4")
        
        guard bundlePath != nil else{
            return
        }
        //cream Url
        let url = URL(fileURLWithPath: bundlePath!)
        //cream video player item
        let item = AVPlayerItem(url: url)
        //cream player
        videoPlayer = AVPlayer(playerItem: item)
        //cream layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        //modificam size
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*2.0, y:0,
                                         width: self.view.frame.width*5,
                                         height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        //play
        videoPlayer?.playImmediately(atRate: 0.1)
    }

}

