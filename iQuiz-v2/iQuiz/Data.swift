//
//  QuizModel.swift
//  iQuiz
//
//  Created by iGuest on 5/11/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation



class Data {
    
    var targetURL = URLToGo.targetURL
    
    var topicsInQuiz : [Topic] = [Topic]()
    
    var names : [String] = []
    var descrs : [String] = []

    func checkLocalStorage() {
        //Check if json exists

//        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let tempDirURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(NSProcessInfo.processInfo().globallyUniqueString, isDirectory: true)
        let filePath = tempDirURL.URLByAppendingPathComponent("quiz.json").absoluteString
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filePath) {
            print("FILE AVAILABLE")
        } else {
            print("FILE NOT AVAILABLE")
        }

    }
    
    
    func HTTPRequest(completionHandler: () -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: targetURL)!) { (data, response, error) -> Void in
//          print(self.targetURL)
            let HTTPResponse = response as! NSHTTPURLResponse
            let statusCode = HTTPResponse.statusCode

            if (statusCode == 200) {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                    
                    // print(json)
                    
                    guard let subject = json as? [[String : AnyObject]] else {return}
                    
                    for s in subject {
                        let name = s["title"] as? String
                        self.names.append(name!)
                        let desc = s["desc"] as? String
                        self.descrs.append(desc!)
                        let questions = s["questions"]
                        
                        var questionsInATopic : [Question] = []
                        
                        for question in questions as! NSArray {
                            let text = question["text"] as! String
                            let answerIntAsString = question["answer"] as! String
                            let choices = question["answers"] as! [String]
                            let correctAnswer = choices[(Int(answerIntAsString)! - 1)]
                            
                            let aQuestion = Question(text: text, answer: correctAnswer, choices: choices)
                            questionsInATopic.append(aQuestion)
                        }
                        let aTopic = Topic(subject: name!, desc: desc!, questions: questionsInATopic)
                        self.topicsInQuiz.append(aTopic)
                    }
                    
                    completionHandler()
                    
                    print("Topics: \(self.topicsInQuiz)")
                    print("\(self.topicsInQuiz[0].subject)")
                    
                }  catch {
                    print("Error Response! \n\(error)")
                }
//                print("ScienceArray: \(self.scienceQs)")
//                for scienceQ in self.scienceQs {
//                    print("Question Name: \(scienceQ.text)")
//                    print("Question Answer: \(scienceQ.correctAnswer)")
//                    print("Question Choices: \(scienceQ.choices)")
//                }
//                print("MarvelArray: \(self.marvelQs)")
//                print("MathArray: \(self.mathQs)")
            }
        }
        task.resume()
    }
}