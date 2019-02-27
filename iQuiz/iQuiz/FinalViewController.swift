//
//  FinalViewController.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/26/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    
    var score: String?
    var outOf: String?
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = (score! + "/" + outOf!)
    }
    

}
