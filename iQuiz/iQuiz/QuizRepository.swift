//
//  QuizRepository.swift
//  iQuiz
//
//  Created by Kyle Goodwin on 2/23/19.
//  Copyright © 2019 Kyle Goodwin. All rights reserved.
//

import Foundation
import UIKit

class QuizRepository{
    
    static var quizList: [Quiz] = []
    
    class func getQuizes() -> [Quiz]{
        
        return quizList
    }
    
    /*
    class func initWithTestData(){
        var quizes : [Quiz] = []
        
        let tempDescs = ["A quiz about Mathematics", "A quiz about Super Heros", "A quiz about Science"]
        
        let tempTitles = ["Mathematics","Marvel Super Heros","Science"]
        
        var images: Array<UIImage> =  [#imageLiteral(resourceName: "marvel.png"),#imageLiteral(resourceName: "math.jpg"),#imageLiteral(resourceName: "sci.png")]
        
        var count = 0
        for _ in tempDescs{
            let quiz = Quiz(title: tempTitles[count], desc: tempDescs[count], image: images[count])
            count += 1
            quizes.append(quiz)
        }
        
        quizList = quizes
    }
 */
    
    class func getAll(completion:@escaping ([Quiz])->()){
        
        guard let url = URL(string: "http://tednewardsandbox.site44.com/questions.json") else {return}
        print("here1")
        
        let task = URLSession.shared.dataTask(with: url){
        
        (data, response, error)  in

            if error != nil{
                print(error!.localizedDescription)
            }
            
            guard let data = data else {return}
            
            do{
                
                let quizData = try JSONDecoder().decode([Quiz].self, from: data)
    
                
                quizList = quizData
                completion(quizList)
                
                
                
            } catch let jsonError{
                print(jsonError)
            }
            
            
            
            
        }
        
        task.resume()
    }
    
}
