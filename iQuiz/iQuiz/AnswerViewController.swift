//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/26/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
   
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wereTheyRightLabel: UILabel!
    
    var quiz: Quiz?
    var questionNum: Int?
    var rightAnswer: String?
    var givenAnswer: String?
    var currentScore: Int?
    var question: String?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        questionLabel.text = question
        correctLabel.text =  rightAnswer
        
        let wereTheyRight = ( rightAnswer == givenAnswer)
        if( wereTheyRight){
            wereTheyRightLabel.text = "You were right"
        }else{
            wereTheyRightLabel.text = "You were wrong"
        }
        
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
       
        
        
    }
    
    
    
    
}
