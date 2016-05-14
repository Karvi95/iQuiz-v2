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
        highlight()
        firstChoice.backgroundColor = UIColor.redColor()
    }
    @IBAction func secondChoicePressed(sender: UIButton) {
        userAnswer = secondChoice.currentTitle
        highlight()
        secondChoice.backgroundColor = UIColor.redColor()
    }
    @IBAction func thirdChoicePressed(sender: UIButton) {
        userAnswer = thirdChoice.currentTitle
        highlight()
        thirdChoice.backgroundColor = UIColor.redColor()
    }
    @IBAction func fourthChoicePressed(sender: UIButton) {
        userAnswer = fourthChoice.currentTitle
        highlight()
        fourthChoice.backgroundColor = UIColor.redColor()
    }
    
    
    @IBAction func submit(sender: UIButton) {
    }

    
    func highlight() {
        firstChoice.backgroundColor = UIColor.clearColor()
        secondChoice.backgroundColor = UIColor.clearColor()
        thirdChoice.backgroundColor = UIColor.clearColor()
        fourthChoice.backgroundColor = UIColor.clearColor()
    }

    var userAnswer : String!
    var intendedAnswer : String!
    
    var currentTopic : Topic!
    var total : Int = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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