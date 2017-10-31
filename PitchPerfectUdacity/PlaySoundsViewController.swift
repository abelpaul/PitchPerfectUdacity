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
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    
    @IBAction func  playSoundForButton( sender: UIButton) {
        print("yo")
         configureUI(.playing)
    }
    @IBAction func  stopButtonPress( sender: UIButton) {
        print("hi")
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

