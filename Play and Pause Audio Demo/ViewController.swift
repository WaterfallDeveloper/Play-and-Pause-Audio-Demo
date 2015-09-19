//
//  ViewController.swift
//  Play & Pause Audio Demo
//  WaterfallDeveloper
//

import UIKit

// we need to import this framework in order to access the audio player
import AVFoundation

class ViewController: UIViewController {
    
    // define a boolean switch to control button status
    var showPlayButton = true
    // create an audio player instance
    var audioPlayer:AVAudioPlayer!
    
    // outlet to change the button's image
    @IBOutlet weak var audioControlButton: UIButton!
    // button action
    @IBAction func audioControlButtonAction(sender: UIButton) {
        // if the play button is displayed, start/resume playing the audio
        // and set the button's image to the pause button
        if showPlayButton {
            audioPlayer.play()
            audioControlButton.setImage(UIImage(named: "pauseButton"), forState: UIControlState.Normal)
        }else{
            // if the pause button is displayed, stop playing the audio
            // and set the button's image to the play button
            audioPlayer.stop()
            audioControlButton.setImage(UIImage(named: "playButton"), forState: UIControlState.Normal)
            
        }
        // the button control switch depends on the audio playback status
        showPlayButton = !audioPlayer.playing
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // retrieve the path to the audio file in URL format
        // change the name and extension accordingly
        if let audioFileUrl = NSBundle.mainBundle().URLForResource("Luka-Intro", withExtension: "m4a") {
            audioPlayer = AVAudioPlayer(contentsOfURL:audioFileUrl, error: nil)
        }else {
            // show message if the file wasn't found
            println("audio file not found")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
