//
//  Quiz.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/16/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class Question: Codable {
    var text: String
    var answer: String
    var answers: [String]
    
    private enum CodingKeys: String,CodingKey {
        case text
        case answer
        case answers
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decode(String.self, forKey: .text)
        answer = try values.decode(String.self, forKey: .answer)
        answers = try values.decode([String].self, forKey: .answers)
    }

}

class Quiz: Codable {
    var title : String
    var desc : String
    var questions : [Question]
    let image: UIImage = #imageLiteral(resourceName: "sci.png")
    
    
    private enum CodingKeys: String,CodingKey {
        case title
        case desc
        case questions
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        desc = try values.decode(String.self, forKey: .desc)
        questions = try values.decode([Question].self, forKey: .questions)
    }
    
    init(title: String, desc: String, questions: [Question]) {
        self.title = title
        self.desc = desc
        self.questions = questions
    }
    
}

//Quizes class to store quizzes locally
class Quizzes: Cachable, Codable {
    
    var fileName: String = "cachedQuizzes"
    var quizes: [Quiz]
    
    init(quizList: [Quiz]) {
        quizes = quizList
    }

}

/*
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
 */
