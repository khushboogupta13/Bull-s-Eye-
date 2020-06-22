//
//  ViewController.swift
//  First game App
//
//  Created by Khushboo Gupta on 22/06/20.
//  Copyright © 2020 Khushboo Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        //        print("The rounded value of the slider is: \(roundedValue)")
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbIamgeNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbIamgeNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
    }
    
    @IBAction func showAlert(){
        
        let difference = abs(targetValue-currentValue)
        var points = 100-difference
        
        score += points
//        round += 1
        
        let title: String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference<5{
            title = "You vere very close!"
            points += 50
        }else{
            title = "You can do better!"
        }
        
        let message = "You scored \(points) points!"
        
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action=UIAlertAction(title: "OK!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
//        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
//        print("The value of the slider is: \(slider.value)")
        let roundedValue = slider.value.rounded()
//        print("The rounded value of the slider is: \(roundedValue)")
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        updateScore()
        updateRound()
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
    }
    
    func updateScore(){
        scoreLabel.text = String(score)
    }
    func updateRound(){
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    

}


