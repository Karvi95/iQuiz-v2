//
//  Question.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation

public class Question {
    public var text : String
    public var correctAnswer : String
    public var choices : [String]
    
    init(text : String, answer : String, choices : [String]){
        self.text = text
        self.correctAnswer = answer
        self.choices = choices
    }
}