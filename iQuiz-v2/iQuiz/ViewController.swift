//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

struct URLToGo {
    static var targetURL = "http://tednewardsandbox.site44.com/questions.json"
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UITextFieldDelegate {
    
    let theData = Data()
    
    @IBOutlet weak var QuizTable: UITableView!
    
    var names : [String] = []
    var descrs : [String] = []
    var images = [UIImage(named: "3"), UIImage(named: "2"), UIImage(named: "1")]
    var topicsInQuiz : [Topic] = [Topic]()
    var topicToSend : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        QuizTable.dataSource = self
        QuizTable.delegate = self
        self.theData.HTTPRequest {
            
            self.names = self.theData.names
            self.descrs = self.theData.descrs
            
            self.topicsInQuiz = self.theData.topicsInQuiz
            
            self.QuizTable.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    URLToGo.targetURL = enteredText!
                } else {
                    URLToGo.targetURL = "http://tednewardsandbox.site44.com/questions.json"
                }
                self!.QuizTable.reloadData()
            }
        })
        
        alertController.addAction(retrieveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuizQuestion") as! QuizQuestionViewController
        self.presentViewController(qVC, animated: false, completion: nil)
        
        topicToSend = indexPath.row
        
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "QuestionSegue") {
                let DestViewController: QuizQuestionViewController = segue.destinationViewController as! QuizQuestionViewController
                DestViewController.currentTopic = topicsInQuiz[topicToSend]
            }
        }
    }
}