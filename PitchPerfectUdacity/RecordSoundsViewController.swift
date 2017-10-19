//
//  RecordSoundsViewController.swift
//  PitchPerfectUdacity
//
//  Created by Abel George on 10/18/17.
//  Copyright © 2017 Abel George. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
  
    var audioRecorder : AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }



    @IBAction func RecordAudio(_ sender: AnyObject) {
        RecordingLabel.text = "recording in progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
    }
    @IBAction func StopRecording(_ sender: AnyObject) {
        RecordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
    }
    
}

