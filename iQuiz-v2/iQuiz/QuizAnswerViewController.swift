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
    
    var result : Bool = true
    
    @IBAction func next(sender: UIButton) {
    }

    var answerImages = [UIImage(named: "y"), UIImage(named: "n")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if result {
            AnswerImage.image = answerImages[0]
        } else {
            AnswerImage.image = answerImages[1]
        }
        correctAnswer.text = intendedAnswer
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