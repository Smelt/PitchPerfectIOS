//
//  ViewController.swift
//  PitchPerfect-A
//
//  Created by Shivam Satyarthi on 2/9/17.
//  Copyright © 2017 Shivam Satyarthi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecording: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stopRecording.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in Progress"
        stopRecording.isEnabled = true
        recordButton.isEnabled = false
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = true
        stopRecording.isEnabled = false
          /*
            audioRecorder.stop()
            let audioSession = AVAudioSession.sharedInstance()
            try! audioSession.setActive(false)
            
            
        */
    }
    
}

