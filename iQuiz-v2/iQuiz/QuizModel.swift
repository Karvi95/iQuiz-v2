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
    var mathQs : [Question] = []
    var marvelQs : [Question] = []

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
                        if let name = s["title"] as? String{
                            self.names.append(name)
                        }
                        if let desc = s["desc"] as? String {
                            self.descrs.append(desc)
                        }
//                        if let questions = s["questions"] {
//                            self.questions.append(questions)
//                        }
                    }
                    
                    completionHandler()
                
                } catch {
                    print("Error Response! \n\(error)")
                }
            }
        }
        task.resume()
    }
}