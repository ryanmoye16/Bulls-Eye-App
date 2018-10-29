//
//  ViewController.swift
//  BullsEye
//
//  Created by Ryan Moye on 10/24/18.
//  Copyright © 2018 Ryan Moye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    var currentValue = 0
    @IBOutlet weak var currentValueLabel: UILabel!
    var differenceValue = 0
    var points = 0
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    var titleMessage = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let leftTrackResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(leftTrackResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let rightTrackResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(rightTrackResizable, for: .normal)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {

        difference()
        points = 100 - differenceValue
        
        let alert = UIAlertController(title: "\(titleMessage)", message: "You scored \(points) points", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.newRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("The slider value is now \(Int(slider.value.rounded()))")
    }
    
    func newRound() {
        currentValue = Int.random(in: 1...100)
        slider.value = 50
        currentValueLabel.text = String(currentValue)
        score += points
        scoreLabel.text = String(score)
        round += 1
        roundLabel.text = String(round)
    }
    
    func difference() {
        if currentValue > Int(slider.value) {
            differenceValue = currentValue - Int(slider.value)
        } else if currentValue < Int(slider.value) {
            differenceValue = Int(slider.value) - currentValue
        } else {
            differenceValue = 0
        }
        if differenceValue == 0 {
            titleMessage = "Perfect"
        } else if differenceValue <= 5 {
            titleMessage = "Almost had it"
        } else {
            titleMessage = "Not even close"
        }
    }
    @IBAction func startOver(_ sender: UIButton) {
        score = 0
        round = 1
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        slider.value = 50
        currentValue = Int.random(in: 1...100)
        currentValueLabel.text = String(currentValue)
    }
    
}

