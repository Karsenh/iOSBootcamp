//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Karsen Hansen on 7/26/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Variables
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    // MARK: - IBOutlets
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    // MARK: - viewDidLoad Main
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    // MARK: - Action Functions
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }


}
