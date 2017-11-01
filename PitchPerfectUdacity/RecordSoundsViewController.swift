//
//  RecordSoundsViewController.swift
//  PitchPerfectUdacity
//
//  Created by Abel George on 10/18/17.
//  Copyright © 2017 Abel George. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
  
    var audioRecorder : AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
    
   // ConfigureUI Function
    func ConfigureUI (_ isRecording: Bool ) {
        
        var message :String = ""
       
        message = isRecording ? "recording in progress" : "Tap to Record"
        stopRecordingButton.isEnabled = isRecording ? true : false
        RecordingLabel.text = message
        recordButton.isEnabled = isRecording ? false : true
        

   
    }

// This is the function for the record button which then stores the data in a .wav file

    @IBAction func RecordAudio(_ sender: AnyObject) {
        ConfigureUI(true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    
    // this is a stop recording function
    @IBAction func StopRecording(_ sender: AnyObject) {
        ConfigureUI(false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)

     
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
   
    }
    // this segues the recordViewController into the Playsounds viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
    }
        }
    }


