//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Dictionary of eggTimes in seconds (5 min, 7 min, 12 min)
    let eggTimes = ["Soft" : 3, "Medium" : 5, "Hard" : 7]
    var totalTime = 0
    var secondsElapsed = 0
    // Timer variable to hold a timer object
    var timer = Timer()
    // Alarm sound variable
    var player: AVAudioPlayer!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBarTimer: UIProgressView!
    
    // Button action
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // Invalidate any previous timers
        timer.invalidate()
        // Hardness = title of pressed button
        let hardness = sender.currentTitle
        // title passed into dictionary as 'hardness; variable
        totalTime = eggTimes[hardness!]!
        // Reset progressBarTimer
        progressBarTimer.progress = 0
        // Reset secondsElapsed
        secondsElapsed = 0
        // Reset titleLabel
        titleLabel.text = hardness
        
        // Timer calling the updateTimer function defined below
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Function to update the timer after button pressed
    @objc func updateTimer() {
        if secondsElapsed < totalTime {
            secondsElapsed += 1
            progressBarTimer.progress = Float(secondsElapsed) / Float(totalTime)
        } else {
            // Timer is done - play alarm
            playSound(soundName: "alarm_sound")
            // Stop the timer object
            timer.invalidate()
            // Change titleLabel text
            titleLabel.text = "Done!"
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
