//
//  iQuizCellTableViewCell.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import UIKit

class iQuizCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizDescription: UILabel!
    
    func setCell(quiz: Quiz){
        quizLabel.text = quiz.Title
        quizImage.image = quiz.Image
        quizDescription.text = quiz.Description
        
    }
}
