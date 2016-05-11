//
//  QuizComponentCell.swift
//  iQuiz
//
//  Created by iGuest on 4/29/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizComponentCell: UITableViewCell {

    @IBOutlet weak var topicPhoto: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var topicDescr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
