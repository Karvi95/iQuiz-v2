//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {

    
    func HTTPRequest() {
        let url = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if data != nil {
                print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            }
            else {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func retrieveData(alert: UIAlertAction!) {
        NSLog("Store user input as variable, reload page, re-search")
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
        
        let retrieveAction : UIAlertAction = UIAlertAction(title: "Check Now", style: .Cancel, handler: retrieveData)
        
        alertController.addAction(retrieveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBOutlet weak var QuizTable: UITableView!
    
    var names = ["Mathematics", "Marvel Super Heroes", "Science"]
    var descrs = ["Once Euler looked out \nat seven bridges to cross. \n'Can’t be done,' he said.", "What can go wrong now? \nGuns, gods, monsters, heroes too! \nNot-death, shwarma break.", "Contract or expand? \nNot the universe's size \nBut the human mind."]
    var images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    var authors = ["- Tao Wang", "- Anonymous" ,"- Cassandra Teas"]
    
    
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
        cell.topicAuthor.text = authors[indexPath.row]
        
        return cell
    }
}

