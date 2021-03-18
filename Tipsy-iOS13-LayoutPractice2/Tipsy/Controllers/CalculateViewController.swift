//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    // MARK: - CalculateView Variables
    var tipAsDecimal = 0.10
    var numPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    // MARK: - IBActions
    @IBAction func percentageChanged(_ sender: UIButton) {
        
        // Resign keyboard upon selecting tip percentage
        billTotalTextField.endEditing(true)
        
        // Set all percentages to unselected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Set selected percentage to isSelected = true
        sender.isSelected = true
        
        // Create variable for button title String; = '10%' (String)
        let buttonTitle = sender.currentTitle!
        print("sender.currentTitle = \(buttonTitle)")
        
        // Cast buttonTitle String ('10%') into String without '%' = '10' (String)
        let tipMinusPercentage = String(buttonTitle.dropLast())
        print("tipMinusPercentage = \(tipMinusPercentage)")
        
        // Cast buttonTitle String into Double without '%' and force unwrap = '10.00'
        let tipAsDouble = Double(tipMinusPercentage)!
        print("tipPercentAsNumber = \(tipAsDouble)")
        
        // Manipulate tipAsDouble into decimal; 0.1 = 10.00 / 100
        tipAsDecimal = tipAsDouble / 100
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        // Set numPeopleLabel text String as single digit value
        numPeopleLabel.text = String(format: "%.0f", sender.value)
        // Set numPeople to the Step value
        numPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // Grab inputed billTotal as String by force unwrapping the TextField.text
        let billTotalAsString = billTotalTextField.text!
        
        // Check if billTotalAsString has input
        if billTotalAsString != "" {
            // Force cast billTotalAsString as Double
            let billAsDouble = Double(billTotalAsString)!
            // splitAmount = total bill amt * (1 + tipAsDecimal) / numPeople
            let result = billAsDouble * (1 + tipAsDecimal) / Double(numPeople)
            print(result)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipAsDecimal * 100)
            destinationVC.numPeople = numPeople
        }
    }
}

