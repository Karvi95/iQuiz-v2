//
//  Topic.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation

public class Topic {
    public var subject : String
    public var desc : String
    public var questions : [AnyObject]
    
    init(subject : String, desc : String, questions : [AnyObject]) {
        self.subject = subject
        self.desc = desc
        self.questions = questions
    }
}