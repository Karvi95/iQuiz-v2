//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UITextFieldDelegate {
    var targetURL = "http://tednewardsandbox.site44.com/questions.json"
    var topicsInQuiz : [Topic] = [Topic]()
    
    func HTTPRequest() {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: targetURL)!) { (data, response, error) -> Void in
//            print(self.targetURL)
            let HTTPResponse = response as! NSHTTPURLResponse
            let statusCode = HTTPResponse.statusCode
            
            if (statusCode == 200) {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
//                    print(json)
                    
                    guard let subject = json as? [[String : AnyObject]] else {return}
                    
                    
                    for s in subject {
                        guard let name = s["title"] as? String,
                            let desc = s["desc"] as? String,
                            let questions = s["questions"] else {return}
                        
                        self.names.append(name)
                        self.descrs.append(desc)
                        self.questions.append(questions)
                        
//                        var aQuestion : Question
//                        let questionsForASubject : [Question]
//
//                        var questionsAvailable : [[String : AnyObject]] = s["questions"]! as! [[String : AnyObject]]
//                        
//                        for i in 0..<questionsAvailable.count {
//                            let choices : [String] = []
//                            let answersAvailable : [String] = questionsAvailable = questionsAvailable[i]["answers"] as! [String]
//                            
//                            var aQuestion : Question
//                            
//                            for j in 0..<answersAvailable.count {
//                                choices.append(j)
//                            }
//                            
//                            aQuestion = Question(text: (questionsAvailable[i]["text"] as? String)!, answer: (Int((questionsAvailable[i]["text"] as? String)!)! - 1), choices: choices)
//                            questionsForASubject.append(aQuestion)
//                        }
                        
                        
                        
                        
//                        
//                        let aTopic = Topic(subject: (s["title"] as? String)!, desc: (s["desc"] as? String)!, questions: (s["questions"] as? [AnyObject])!)
//                        self.topicsInQuiz.append(aTopic)
                    }
                   
 
                } catch {
                    print("Error Response! \n\(error)")
                }
            } else {
                
            }
            
        }
        task.resume()
    }
    
    func dismissAlert(alert: UIAlertAction!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        let alertController : UIAlertController = UIAlertController(title: "Alert!", message: "Settings go here.", preferredStyle: .Alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Okay", style: .Default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter URL to retrieve information."
        }

        let retrieveAction : UIAlertAction = UIAlertAction(title: "Check Now", style: .Cancel, handler: {[weak self]
            (paramAction:UIAlertAction!) in
            if let textFields = alertController.textFields {
                let theTextFields = textFields as [UITextField]
                let enteredText = theTextFields[0].text
                if enteredText != nil {
                    self!.targetURL = enteredText!
                    print("USER INPUT: \(self!.targetURL)")
                } else {
                    self!.targetURL = "http://tednewardsandbox.site44.com/questions.json"
                }
                
            }
self!.HTTPRequest()
        })
        
        alertController.addAction(retrieveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBOutlet weak var QuizTable: UITableView!
    
    var names : [String] = []
    var descrs : [String] = []
    var images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    var questions: [AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        HTTPRequest()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.QuizTable.dequeueReusableCellWithIdentifier("QuizCell", forIndexPath: indexPath) as! QuizComponentCell
        
        cell.topicPhoto.image = images[indexPath.row]
        cell.topicName.text = names[indexPath.row]
        cell.topicDescr.text = descrs[indexPath.row]      
        return cell
    }
}