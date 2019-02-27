//
//  QuestionsViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/17/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var quiz: Quiz?
    var questionCount: Int?
    var selectedAnswer: String?
    var correctAnswer: String?
    var currentScore: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = quiz!.questions[questionCount ?? 0].text
        
        tableView.delegate = self
        tableView.dataSource = self
        nextButton.isEnabled = false
        nextButton.setTitle("Please Select an Answer", for: .normal)
        
        let correct:Int? = Int(quiz!.questions[questionCount!].answer)
        let correctString = quiz!.questions[questionCount!].answers[correct!-1]
        correctAnswer = correctString
        
    }
    
    
    

    
     @IBAction func nextTouch(_ sender: Any) {
      
        
        /*
        if quiz!.questions.count > questionCount! + 1{
            questionCount! += 1
            questionLabel.text = quiz!.questions[questionCount!].text
            tableView.reloadData()
        }else{
            self.performSegue(withIdentifier: "finish", sender: nil)
        }
 */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if let button = sender as? UIButton{
            
            if button.tag == 2{
                print("Buttontagwas2")
            let destVC = segue.destination as! AnswerViewController
            destVC.question = quiz!.questions[questionCount!].text
            destVC.rightAnswer = quiz!.questions[questionCount!].answer
            destVC.givenAnswer = selectedAnswer!
            destVC.currentScore = currentScore!
            destVC.rightAnswer = correctAnswer!
            }
            
        }
        
    }
     
    
}


extension QuestionsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz!.questions[questionCount ?? 0].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = quiz!.questions[questionCount ?? 0 ].answers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as! QuizAnswerCell
        
        cell.setCell(question: question)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(quiz!.questions[questionCount ?? 0].answers[indexPath.row])
        selectedAnswer = quiz!.questions[questionCount ?? 0].answers[indexPath.row]
        nextButton.isEnabled = true
        nextButton.setTitle("Next: Check Answer", for: .normal)
        
    }
    
}
