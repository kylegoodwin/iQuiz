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
    
    static var quizList: Quizzes = Quizzes(quizList: [])
    
    static var jsonURL: String = "http://tednewardsandbox.site44.com/questions.json"
    
    class func getQuizes() -> [Quiz]{
        
        return quizList.quizes
    }
    
    class func setQuizes(quizes: Quizzes){
        quizList = quizes
    }
    
    class func setJSON(json: String){
        jsonURL = json
    }
    
    class func getAll(completion:@escaping ([Quiz])->()){
        
        guard let url = URL(string: jsonURL) else {return}
        
        let task = URLSession.shared.dataTask(with: url){
        
        (data, response, error)  in

            if error != nil{
                print(error!.localizedDescription)
                completion([])
               
            }
            
            guard let data = data else {return}
            
            do{
                
                let quizData = try JSONDecoder().decode([Quiz].self, from: data)
    
                
                quizList.quizes = quizData
                completion(quizList.quizes)
                
                
                
            } catch let jsonError{
                print(jsonError)
                completion([])
            }
            
            
            
            
        }
        
        task.resume()
    }
    
}
