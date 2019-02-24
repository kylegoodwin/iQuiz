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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = quiz!.title
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    
     @IBAction func nextTouch(_ sender: Any) {
        print("fuck")
        
     }
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuestionsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz!.questions[0].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = quiz!.questions[0].answers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as! QuizAnswerCell
        
        cell.setCell(question: question)
        
        return cell
        
    }
}
