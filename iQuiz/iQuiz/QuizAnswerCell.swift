//
//  QuizAnswerCell.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/24/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class QuizAnswerCell: UITableViewCell {

    @IBOutlet weak var textForQ: UILabel!
    
    func setCell(question: String){
        
        textForQ.text = question
        
    }
    
}


