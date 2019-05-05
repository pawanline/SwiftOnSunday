//
//  InterfaceController.swift
//  WatchReactions WatchKit Extension
//
//  Created by Pawan Kumar on 05/05/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import WatchKit
import AVFoundation


class InterfaceController: WKInterfaceController, SoundPlaying {
    
    var audioPlayer: AVAudioPlayer?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func playSound1() {
        playSound(named: "Passenger-let-her-go")
    }
    
    @IBAction func playSound2() {
        playSound(named: "Kumar-sanu-ek-sanam-chaiye")
    }
    
    @IBAction func playSound3() {
        playSound(named: "James-you-are-beautiful")
    }
    @IBAction func playSound4() {
        playSound(named: "Guitar-sikhda")
    }
    
    
}
