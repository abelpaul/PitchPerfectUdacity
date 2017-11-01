//
//  PlaySoundsViewController.swift
//  PitchPerfectUdacity
//
//  Created by Abel George on 10/20/17.
//  Copyright © 2017 Abel George. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    

    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // importing variables from AVFoundation
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast=1, chipmunk=2, vader=3, echo=4, reverb=5
    }
    
    // this button maps all sound rates for each sound effect button
    @IBAction func  playSoundForButton( sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    // this function allows the stop button to be pressed and stops the audio from being played
    @IBAction func  stopButtonPress( sender: UIButton) {
    stopAudio()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }

    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        configureUI(.notPlaying)
   
  
    }
    


}

