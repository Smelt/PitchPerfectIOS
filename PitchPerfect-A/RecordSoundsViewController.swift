//
//  RecordSoundsViewController.swift
//  PitchPerfect-A
//
//  Created by Shivam Satyarthi on 2/9/17.
//  Copyright © 2017 Shivam Satyarthi. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecording: UIButton!
    var audioRecorder: AVAudioRecorder!
    
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
        
        //this gets the directory we will save our audio file to
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as
        String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = pathArray.joined( separator: "/")
        let urlPath = URL(fileURLWithPath: filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder  = AVAudioRecorder(url: urlPath, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = true
        stopRecording.isEnabled = false
    
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else{
            print("Recording was not successful!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination  as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
            
    }
    
}

