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
    
    func setTitle(title: String){
        quizLabel.text = title
    }
}
