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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizes = createTitles()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @IBAction func settingsPress(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "This is where settings go.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        
        self.present(alert,animated: true,completion: nil)
        
        
    }
    
    func createTitles() -> [Quiz]{
        
        var quizes : [Quiz] = []
        
        let tempDescs = ["A quiz about Mathematics", "A quiz about Super Heros", "A quiz about Science"]
        
        let tempTitles = ["Mathematics","Marvel Super Heros","Science"]
        
        var images = [#imageLiteral(resourceName: "marvel.png"),#imageLiteral(resourceName: "math.jpg"),#imageLiteral(resourceName: "sci.png")]
        
        var count = 0
        for _ in tempDescs{
            let quiz = Quiz(title: tempTitles[count], desc: tempDescs[count], image: images[count])
            count += 1
            quizes.append(quiz)
        }
        return quizes

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
