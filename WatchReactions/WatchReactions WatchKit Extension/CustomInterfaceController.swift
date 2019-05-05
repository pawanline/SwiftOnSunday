//
//  CustomInterfaceController.swift
//  WatchReactions
//
//  Created by Pawan Kumar on 05/05/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import WatchKit
import AVFoundation


class CustomInterfaceController: WKInterfaceController {
  
       let saveUrl = FileManager.default.getDocumentDirectory().appendingPathComponent("recording.wav")
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
    
    
    @IBAction func recordTapped() {

        presentAudioRecorderController(withOutputURL: saveUrl, preset: .narrowBandSpeech) {
            success,error in
            if success {
                print("Saved Successfully")
            } else {
                print(error?.localizedDescription ?? "Unknown error")
            }
        }
        
    }
    
    @IBAction func playTapped() {
        guard FileManager.default.fileExists(atPath: saveUrl.path) else { return }
        
        try? audioPlayer = AVAudioPlayer(contentsOf: saveUrl)
        audioPlayer?.play()
        
    }
    
    
}
