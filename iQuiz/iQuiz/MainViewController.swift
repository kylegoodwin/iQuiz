//
//  MainViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    
    var quizes: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizes = createTitles()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createTitles() -> [String]{
        
        let tempTitles = ["Mathematics","Marvel Super Heros","Science"]
        return tempTitles
        
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = quizes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! iQuizCellTableViewCell
        
        cell.setTitle(title: title)
        
        return cell
        
    }
}
