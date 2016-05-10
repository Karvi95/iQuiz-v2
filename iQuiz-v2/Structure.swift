//
//  Structure.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation

public class Question {
    public var text : String
    public var answer : Int
    public var answers : [String]
    
    init(text : String, answer : Int, answers : [String]){
        self.text = text;
        self.answer = answer;
        self.answers = answers;
    }
}

public class Structure {
    public var title : String
    public var desc : String
    public var questions : [Question]
    
    init(title : String, desc : String, questions : [Question]) {
        self.title = title
        self.desc = desc
        self.questions = questions
    }
}