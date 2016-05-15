//
//  QuizQuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/2/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizQuestionViewController: UIViewController {

    @IBOutlet weak var QuestionName: UILabel!
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var fourthChoice: UIButton!
    
    @IBOutlet weak var submission: UIButton!
    
    @IBAction func firstChoicePressed(sender: UIButton) {
        userAnswer = firstChoice.currentTitle
//        print("USERANSWER \(userAnswer)")
        highlight()
        firstChoice.backgroundColor = UIColor.redColor()
        submission.enabled = true
        submission.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submission.backgroundColor = UIColor.purpleColor()
    }
    @IBAction func secondChoicePressed(sender: UIButton) {
        userAnswer = secondChoice.currentTitle
//        print("USERANSWER \(userAnswer)")
        highlight()
        secondChoice.backgroundColor = UIColor.redColor()
        submission.enabled = true
        submission.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submission.backgroundColor = UIColor.purpleColor()
    }
    @IBAction func thirdChoicePressed(sender: UIButton) {
        userAnswer = thirdChoice.currentTitle
//        print("USERANSWER \(userAnswer)")
        highlight()
        thirdChoice.backgroundColor = UIColor.redColor()
        submission.enabled = true
        submission.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submission.backgroundColor = UIColor.purpleColor()
    }
    @IBAction func fourthChoicePressed(sender: UIButton) {
        userAnswer = fourthChoice.currentTitle
//        print("USERANSWER \(userAnswer)")
        highlight()
        fourthChoice.backgroundColor = UIColor.redColor()
        submission.enabled = true
        submission.backgroundColor = UIColor.purpleColor()
    }

    
    @IBAction func submit(sender: UIButton) {
        let aVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuizAnswer") as! QuizAnswerViewController
        
        aVC.intendedAnswer = self.intendedAnswer
//        print("INTENDED IN SUBMIT: \(self.intendedAnswer)")
        
        if userAnswer == intendedAnswer {
            self.result = true
            userScore += 1
        }
//        print("RESULT IN SUBMIT: \(self.result)")
        
        aVC.result = self.result
        
        aVC.currentTopic = self.currentTopic
                
        aVC.userScore = self.userScore
        aVC.currQNum = self.currQNum
        aVC.total = self.total
        
//        print("CURRENTQNUMBER: \(currQNum)")
        
        print("I SHOULD PRINT FIRST")
        self.presentViewController(aVC, animated: false, completion: nil)
    }

    func highlight() {
        firstChoice.backgroundColor = UIColor.clearColor()
        secondChoice.backgroundColor = UIColor.clearColor()
        thirdChoice.backgroundColor = UIColor.clearColor()
        fourthChoice.backgroundColor = UIColor.clearColor()
    }


    var currentTopic : Topic!

    var userAnswer : String!
    var intendedAnswer : String!
    
    var userScore : Int = 0
    var currQNum : Int = 0
    var total : Int = 0
    var result : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        QuestionName.text = currentTopic!.questions[currQNum].text
        firstChoice.setTitle(currentTopic.questions[currQNum].choices[0], forState: UIControlState.Normal)
        secondChoice.setTitle(currentTopic.questions[currQNum].choices[1], forState: UIControlState.Normal)
        thirdChoice.setTitle(currentTopic.questions[currQNum].choices[2], forState: UIControlState.Normal)
        fourthChoice.setTitle(currentTopic.questions[currQNum].choices[3], forState: UIControlState.Normal)
        intendedAnswer = currentTopic.questions[currQNum].correctAnswer
        
        total = currentTopic.questions.count
        submission.enabled = false

        submission.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        submission.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}