//
//  Quiz.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class Quiz{
    var Title : String
    var Description: String
    
    var Image: UIImage
    
    
    init(title: String, desc: String, image: UIImage) {
        self.Title = title
        self.Description = desc
        self.Image = image
    }
    
}
