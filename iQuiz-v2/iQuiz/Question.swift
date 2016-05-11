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
    public var answer : Int
    public var choices : [String]
    
    init(text : String, answer : Int, choices : [String]){
        self.text = text
        self.answer = answer
        self.choices = choices
    }
}