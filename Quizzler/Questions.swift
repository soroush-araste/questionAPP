//
//  Questions.swift
//  Quizzler
//
//  Created by soroush amini araste on 12/2/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionsText : String
    let answer : Bool
    
    init(text:String , correctAnswer:Bool) {
        questionsText = text
        answer = correctAnswer
    }
}
