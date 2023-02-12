//
//  Logic.swift
//  MyAdventure
//
//  Created by Laurel Walker Davis on 2/9/23.
//

import Foundation

class Logic {
    
    var userChoice : Option?
    var nextQuestion : Int = 0
    
    let question = [
        
        Question( // 0
            "You've just won an opportunity to take any trip you choose. How would you like to travel?",
            Option("Cruise", 1),
            Option("Plane", 2)),

        Question( // 1
            "You've selected your mode of transportation. Now, where to?",
            Option("North America", 3, ""),
            Option("Europe", 4, "")),
        
        Question( // 2
            "You've selected your mode of transportation. Now, where to?",
            Option("Africa", 5, ""),
            Option("Asia", 6, "")),

        Question( // 3
            "Great! What do you want to do while there?",
            Option("Visit Times Square in NYC", 7, "You were mugged by a Batman impersonator in Times Square."),
            Option("Take a canoe to the indigenous Kuna tribe in the Darien Gap", 8, "The Kuna people welcomed you graciously and gifted you a beautiful, handcrafted mola to commemorate your experience.")),
        
        Question( // 4
            "Great! What do you want to do while there?",
            Option("Lounge under the Eiffel Tower drinking wine and feasting on Parisian delicacies", 9, "You got lost in a deluge of people all clamoring for a picnic spot with a view. You had to settle for sitting behind a group of roudy students. Then, it rained."),
            Option("Venture a stay in the seaside town of Antalya, Turkey in the Mediterranean", 10, "Your Turkish host made you homemade, gourmet meals every night and you spent your days relaxing by the sea and getting pampered in the Turkish baths.")),
        
        Question( // 5
            "Great! What do you want to do while there?",
            Option("Wander the pyramids of ancient Egypt", 11, "You've seen \"The Mummy\"? That pretty much sums up your experience."),
            Option("Head for Tanzania to go on safari in the Serengeti National Park", 12, "You caught a glimpse of the rare Caracal and reported it back to conservationists, who now consider you a local hero!")),
        
        Question( // 6
            "Great! What do you want to do while there?",
            Option("Eat your way through the floating markets of Thailand", 13, "You ate the best street food you've had in your life, made forever friends with the very hospitable Thai people, and successfully avoided being pummeled by any Tuk-tuks."),
            Option("Visit the Zen gardens of the Kinkakuji Temple in Japan", 14, "You spent three days in silent reflection while guided by a local Zen master. Then, you danced with robots at a club in Tokyo. Just to even things out.")),
    ]
    
    let image = [
        "b2",
        "modeOfTrans",
        "northAmerica",
        "europe",
        "africa",
        "asia",
        "nyc",
        "darien",
        "paris",
        "turkey",
        "egypt",
        "tanzania",
        "thailand",
        "japan",
    ]
        
    func getNextQuestion() -> Question {
        return question[nextQuestion]
    }
    
    
    func setChoice(str: String, que: Question) {
        if (str == que.option1.optionText) {
            userChoice = que.option1
        }
        else {
            userChoice = que.option2
        }
        nextQuestion = userChoice!.nextQuestionIndex
    }
    
    func displayOutcome() -> String {
        return userChoice!.outcome
    }
    
    // return true if there are more questions left
    func stillTraveling() -> Bool {
        return userChoice!.nextQuestionIndex < 7
    }
    
    func getImageName() -> String {
        if (nextQuestion == 1 || nextQuestion == 2) {
            return image[1]
        }
        return image[userChoice!.nextQuestionIndex - 1]
    }
        
}

