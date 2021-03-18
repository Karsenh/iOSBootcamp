//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Karsen Hansen on 8/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tip = 10
    var numPeople = 2
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        splitLabel.text = "Split among \(numPeople) people @ \(tip)% tip."
        
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
