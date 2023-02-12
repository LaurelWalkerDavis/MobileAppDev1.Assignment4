//
//  Option.swift
//  MyAdventure
//
//  Created by Laurel Walker Davis on 2/7/23.
//

import Foundation


public class Option {
    init(_ optText: String, _ nextQuestID: Int = 999, _ outcm: String = "") {
        optionText = optText
        nextQuestionIndex = nextQuestID
        outcome = outcm
    }
    
    var optionText: String
    var nextQuestionIndex: Int
    var outcome: String
}

public class Question {
    init(_ questText: String, _ optOne: Option, _ optTwo: Option) {
        questionText = questText
        option1 = optOne
        option2 = optTwo
    }
    
    var questionText: String
    var option1: Option
    var option2: Option
}




