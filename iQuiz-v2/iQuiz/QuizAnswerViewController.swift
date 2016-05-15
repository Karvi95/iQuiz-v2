//
//  QuizAnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/2/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizAnswerViewController: UIViewController {

    @IBOutlet weak var QuestionName: UILabel!
    
    @IBOutlet weak var AnswerImage: UIImageView!
    @IBOutlet weak var correctAnswer: UILabel!
    
    var intendedAnswer : String!
    
    var result : Bool = false
    
    var currentTopic : Topic!
    
    var userScore : Int = 0
    var currQNum : Int = 0
    var total : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        QuestionName.text = currentTopic.questions[currQNum].text
        if result {
            AnswerImage.image = answerImages[0]
        } else {
            AnswerImage.image = answerImages[1]
        }
//        correctAnswer.text = "The answer was: " + intendedAnswer
        print("TOPIC: \(self.currentTopic)")
        print("INTENDED: \(self.intendedAnswer)")
        print("RESULT: \(self.result)")
        print("USERSCORE: \(self.userScore)")
        print("CURRQNUM: \(self.currQNum)")
        print("TOTAL: \(self.total)")
    
    }
    
    @IBAction func next(sender: UIButton) {
        if currQNum < total {
        let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuizQuestion") as! QuizQuestionViewController
            qVC.currentTopic = self.currentTopic
            qVC.userScore = self.userScore
            currQNum += 1
            qVC.currQNum = self.currQNum
            self.presentViewController(qVC, animated: true, completion: nil)
        } else {
            let rVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuizFinished") as! QuizFinishedViewController
            rVC.userScoreInt = self.userScore
            self.presentViewController(rVC, animated: true, completion: nil)
        }
    }

    var answerImages = [UIImage(named: "y"), UIImage(named: "n")]
    


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