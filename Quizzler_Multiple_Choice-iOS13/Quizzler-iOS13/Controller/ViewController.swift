//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        // Set Progress Bar
        progressBar.progress = quizBrain.getProgress()
        // Keep Score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        // Question Text
        progressLabel.text = quizBrain.getQuestionText()
        // Answer Choice Button Text
        quizBrain.getButtonText(choiceA, choiceB, choiceC)
        // Reset button backgrounds to clear after each press
        quizBrain.clearButtons(choiceA, choiceB, choiceC)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
    
        // True or False value for userGotItRight
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // CORRECT Answer - Progress to next question or restart
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Button background color delay to show correct / incorrect
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
}

