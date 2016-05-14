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
    
    
    var scienceQs : [Question] = []
    var marvelQs : [Question] = []
    var mathQs : [Question] = []

    var AllQuestions : [[Question]] = []

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
                    
print(json)
                    
                    guard let subject = json as? [[String : AnyObject]] else {return}
                    
                    for s in subject {
                        let name = s["title"] as? String
                        self.names.append(name!)
                        if let desc = s["desc"] as? String {
                            self.descrs.append(desc)
                        }
                        let questions = s["questions"]
                            for question in questions as! NSArray {
                                let text = question["text"] as! String
                                let answerIntAsString = question["answer"] as! String
                                let choices = question["answers"] as! [String]
                                let correctAnswer = choices[(Int(answerIntAsString)! - 1)]
                                switch name! {
                                    case "Science!":
                                        self.scienceQs.append(Question(text: text, answer: correctAnswer, choices: choices))
                                    case "Marvel Super Heroes":
                                        self.marvelQs.append(Question(text: text, answer: correctAnswer, choices: choices))
                                    case "Mathematics":
                                            self.mathQs.append(Question(text: text, answer: correctAnswer, choices: choices))
                                    default:
                                            break
                                }
                            }
                    }
                    
                    self.AllQuestions.append(self.scienceQs)
                    self.AllQuestions.append(self.marvelQs)
                    self.AllQuestions.append(self.mathQs)
                    
                    completionHandler()
                    
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