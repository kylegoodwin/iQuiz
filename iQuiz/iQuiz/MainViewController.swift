//
//  MainViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    
    var quizes: [Quiz] = []

    @IBOutlet weak var tableView: UITableView!
    
    let cacher: Cacher = Cacher(destination: .atFolder("Cacher"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let status = CheckInternet.Connection()
        
        if status{
        QuizRepository.getAll(completion: { (newQs: [Quiz]) in
            self.quizes = newQs
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
                quizes = cachedQuizzes.quizes
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
        }
        
    }
    
    
    @IBAction func settingsPress(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "This is where settings go.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert,animated: true,completion: nil)
        
        
    }

    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = quizes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! iQuizCellTableViewCell
        
        cell.setCell(quiz: quiz)
        
        return cell
        
    }
}
