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
    
    @IBOutlet weak var firstChoice: UILabel!
    @IBOutlet weak var secondChoice: UILabel!
    @IBOutlet weak var thirdChoice: UILabel!
    @IBOutlet weak var fourthChoice: UILabel!
    
    @IBAction func submit(sender: UIButton) {
    }

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
            
            firstChoice.text = aQuestion.choices[0]
            secondChoice.text = aQuestion.choices[1]
            thirdChoice.text = aQuestion.choices[2]
            fourthChoice.text = aQuestion.choices[3]
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