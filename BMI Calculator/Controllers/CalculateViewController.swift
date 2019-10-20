//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Amerigo Mancino on 19/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // gets triggered every time the slider change
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    // gets triggered every time the slider change
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text =  "\(weight)Kg"
    }
    
    // gets triggered when the user presses the calculate button
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // calculate the BMI
        calculatorBrain.calculateBmi(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    // prepare to go to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the segue I'm landing on is the one with identifier "goToResult"
        if segue.identifier == "goToResult" {
            // downcasting to specify we're landing on the ResultViewController...
            let destinationVC = segue.destination as! ResultViewController
            // ... so we can access to its properties
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

