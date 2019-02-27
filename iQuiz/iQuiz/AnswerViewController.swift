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
    var wereTheyRight: Bool?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        questionLabel.text = question
        correctLabel.text =  rightAnswer
        
        wereTheyRight = ( rightAnswer == givenAnswer)
        if( wereTheyRight!){
            wereTheyRightLabel.text = "You were right"
        }else{
            wereTheyRightLabel.text = "You were wrong"
        }
        
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        if (questionNum! + 1) < quiz!.questions.count{
            performSegue(withIdentifier: "sendToQuestion", sender: sender)
        }else{
            performSegue(withIdentifier: "sendToEnd", sender: sender)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendToQuestion"{
            
            var newScore = currentScore
            
            if( wereTheyRight!){
                newScore = newScore! + 1
            }
            
            let destVC = segue.destination as! QuestionsViewController
            destVC.quiz = quiz
            destVC.questionCount = questionNum! + 1
            destVC.currentScore = newScore
        }else if segue.identifier == "sendToEnd" {
            
            let destVC = segue.destination as! FinalViewController
            destVC.score = String(currentScore!)
            destVC.outOf = String(quiz!.questions.count)
            
        }
        
        
        
        
    }
    
    
    
    
}
