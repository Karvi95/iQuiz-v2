//
//  QuizFinishedViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/2/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizFinishedViewController: UIViewController {

    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var resultComment: UILabel!
    
    
    var currentTopic : Topic!
    
    var userScoreInt : Int = 0
    var totalInt : Int = 0
    
    func evaluate() {
        if ((Double(userScoreInt) / Double(totalInt) == 1.0)){
            self.resultComment!.text! = "Perfect!"
        } else if (Double(userScoreInt) / Double(totalInt) >= 0.75) {
            self.resultComment!.text! = "So close!"
        } else if (Double(userScoreInt) / Double(totalInt) == 0.5) {
            self.resultComment!.text! = "Half right."
        } else if userScoreInt > 0 {
            self.resultComment!.text! = "At least you tried?"
        } else {
            self.resultComment!.text! = "...Git Gud."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userScore.text = "\(userScoreInt)"
        Total.text = "\(totalInt)"
        evaluate()
        
        print("YOUR SCORE: \(userScoreInt)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Next(sender: AnyObject) {
        let HomeVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuizHome") as! ViewController
        self.presentViewController(HomeVC, animated: false, completion: nil)
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