//
//  MainViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    let cacher: Cacher = Cacher(destination: .atFolder("Cacher"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let status = CheckInternet.Connection()
        
        if status{
        QuizRepository.getAll(completion: { (newQs: [Quiz]) in
            
            let quizzesObject = Quizzes(quizList: newQs)
            
            self.cacher.persist(item: quizzesObject) { url, error in
                if let error = error {
                    print("Text failed to persist: \(error)")
                } else {
                    print("Text persisted in \(String(describing: url))")
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
        }else{
            
            if let cachedQuizzes: Quizzes = cacher.load(fileName: "cachedQuizzes") {
                // Replace the current text with the cached one
                print("HERE WE GO")
                QuizRepository.setQuizes(quizes: cachedQuizzes)
            }
            
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !CheckInternet.Connection(){
        let alert = UIAlertController(title: "Network Error", message: "Not connected to the internet. Cached Quizzes are used.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert,animated: true,completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if let thing = sender as? iQuizCellTableViewCell{
            let destVC = segue.destination as! QuestionsViewController
            destVC.quiz = thing.fullQuiz
            destVC.questionCount = 0
        }
        
    }
    
    
    @IBAction func settingsPress(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Settings", message:
            "Enter a quiz link", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Download", style: .default) { (_) in
            guard let textFields = alertController.textFields,
                textFields.count > 0 else {
                    // Could not find textfield
                    return
            }
            
            QuizRepository.setJSON(json: textFields[0].text!)
                QuizRepository.getAll(completion: { (newQuestions: [Quiz]) in
                    
                    self.cacher.persist(item: Quizzes(quizList: newQuestions)) { url, error in
                        if let error = error {
                            print("Text failed to persist: \(error)")
                        } else {
                            print("Text persisted in \(String(describing: url))")
                        }
                    }
                    //self.quizzes = newQuestions
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            
                print("reloaded")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Quiz Link"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        //alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizRepository.getQuizes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = QuizRepository.getQuizes()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! iQuizCellTableViewCell
        
        cell.setCell(quiz: quiz)
        
        return cell
        
    }
}
