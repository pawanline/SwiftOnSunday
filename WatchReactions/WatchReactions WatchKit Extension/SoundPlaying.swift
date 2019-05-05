//
//  SoundPlaying.swift
//  WatchReactions WatchKit Extension
//
//  Created by Pawan Kumar on 05/05/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import AVFoundation

protocol SoundPlaying: AnyObject {
    var audioPlayer: AVAudioPlayer?  { get set}
    
    
}


extension SoundPlaying {
    func  playSound(named name: String)  {
        guard let url = Bundle.main.url(forResource: name, withExtension: "MP3") else {
            fatalError("unable to find song \(name).mp3")
        }
        
        try? audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
}
