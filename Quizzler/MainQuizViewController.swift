//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class MainQuizViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    var nextQuestionTimer : Timer!
    var aoutoNextQuestionWithNoAnswer = Timer()
    var second = 5
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        aoutoNextQuestionWithNoAnswer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timeToAnswerEachQuestion), userInfo: nil, repeats: true)
        
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
            second = 6
        } else if sender.tag == 2 {
            pickedAnswer = false
            second = 6
        }
        checkAnswer()
        nextQuestionTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector (useTimerToNextQuestion), userInfo: nil, repeats: false)
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score : \(score)"
        let numberHolderForProgress = CGFloat(allQuestion.list.count)
        progressLabel.text = "\(questionNumber + 1) / \(allQuestion.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / numberHolderForProgress  ) * CGFloat(questionNumber + 1)
      
    }
    

    func nextQuestion() {
        
        if questionNumber < allQuestion.list.count{
            questionLabel.text = allQuestion.list[questionNumber].questionsText
           updateUI()
        } else {
            
            let alert = UIAlertController(title: "End of Game", message: "Play Again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        } else{
            ProgressHUD.showError("Wrong Baby!")
        }
        nextQuestion()
        }
    
    
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
        score = 0
        scoreLabel.text = "Score : \(score)"
    }
    
    func useTimerToNextQuestion() {
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    func timeToAnswerEachQuestion() {
        
        second -= 1
        timerLabel.text = "TIMER : \(second)"
        if second == 0 {
            second = 6
            useTimerToNextQuestion()
            
        }
        
        
        
    }

    
}
