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
    var quiz: Quiz?
    var questionCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = quiz!.questions[questionCount ?? 0].text
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    
     @IBAction func nextTouch(_ sender: Any) {
      
        print(quiz?.questions.count)
        if quiz!.questions.count > questionCount! + 1{
            questionCount! += 1
            questionLabel.text = quiz!.questions[questionCount!].text
            tableView.reloadData()
        }else{
            self.performSegue(withIdentifier: "finish", sender: nil)
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
}
