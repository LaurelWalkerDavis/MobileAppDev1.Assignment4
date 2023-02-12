//
//  ViewController.swift
//  MyAdventure
//
//  Created by Laurel Walker Davis on 2/7/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!

    
    var logic = Logic()
    var currentQuestion: Question?

        
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = logic.question[0]
        logic.userChoice = currentQuestion!.option1
        updateUI()
    }

    @IBAction func selectionSubmitted(_ sender: UIButton) {
        let userChoiceString = sender.titleLabel!.text!
        logic.setChoice(str: userChoiceString, que: currentQuestion!)
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if (logic.stillTraveling()) {
            
            currentQuestion = logic.getNextQuestion()
            background.image = UIImage(named: String(logic.getImageName()))
            questionLabel.text = currentQuestion!.questionText
            buttonOne.setTitle(currentQuestion!.option1.optionText, for: .normal)
            buttonTwo.setTitle(currentQuestion!.option2.optionText, for: .normal)
        }
        else {
            questionLabel.text = logic.displayOutcome()
            background.image = UIImage(named: String(logic.getImageName()))
            buttonOne.isHidden = true
            buttonTwo.isHidden = true
        }
    }
    
}

