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
    
    @IBAction func firstChoicePressed(sender: UIButton) {
        userAnswer = firstChoice.currentTitle
    }
    @IBAction func secondChoicePressed(sender: UIButton) {
        userAnswer = secondChoice.currentTitle
    }
    @IBAction func thirdChoicePressed(sender: UIButton) {
        userAnswer = thirdChoice.currentTitle
    }
    @IBAction func fourthChoicePressed(sender: UIButton) {
        userAnswer = fourthChoice.currentTitle
    }
    
    
    @IBAction func submit(sender: UIButton) {
        
    }

    var userAnswer : String!
    var intendedAnswer : String!
    
    var questionsFromJSON : [AnyObject] = []
    var questionsForASubject : [Question] = []
    var total : Int = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let unprocesseds = questionsFromJSON as [AnyObject]? else {return}
        
        for question in unprocesseds {
            guard let text = question["text"] as? String,
                let answer = question["answer"] as? String,
                let choices = question["answers"] as? [String] else {return}
            
            questionsForASubject.append(Question(text: text, answer: (Int(answer)! - 1), choices: choices))
        }
        
        total = questionsForASubject.count
        
        for aQuestion in questionsForASubject {
            QuestionName.text = aQuestion.text
            
            firstChoice.setTitle(aQuestion.choices[0], forState: .Normal)
            secondChoice.setTitle(aQuestion.choices[1], forState: .Normal)
            thirdChoice.setTitle(aQuestion.choices[2], forState: .Normal)
            fourthChoice.setTitle(aQuestion.choices[3], forState: .Normal)
            
        }
        
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