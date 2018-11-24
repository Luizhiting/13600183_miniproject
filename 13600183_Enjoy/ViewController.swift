//
//  ViewController.swift
//  13600183_Enjoy
//
//  Created by ธีราพร สุทนต์ on 9/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 10
    var timer = Timer()
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func startButton(_ sender: Any) {
       
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        startOutlet.isHidden = true
        }
    
    @objc func counter()
    {
        seconds -= 1
        timeLabel.text = String(seconds) + " S "
        
        if (seconds == 0)
        {
            timer.invalidate()
           
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
        seconds = 10
        timeLabel.text = "10 S"
        
       
        
        
        startOutlet.isHidden = false
    }
    
    @IBAction func play(_ sender: Any) {
         player.play()
    }
    
    @IBAction func stop(_ sender: Any) {
         player.stop()
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "blackpink", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //ERROR
        }
        
        
    }
    
    

    
    
}


