//
//  ViewController.swift
//  Project2
//
//  Created by Paul Yi on 10/22/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var questionCount = 0
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland",
        "italy", "monaco", "nigeria", "poland", "russia", "spain",
        "uk", "us"]
        
        askQuestion(action: nil)
        
        // 1. Try showing the player's score in the navigation bar, alongside the flag to guess.
        self.navigationItem.title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            questionCount += 1
        } else {
            // 3. When someone chooses the wrong flag, tell them their mistake in your alert message - something like "Wrong! That's the flag of France," for example.
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            questionCount += 1
        }
        
        // 2. Keep track of how many questions have been asked, and show one fianl alert controller after they have answered 10. This should show their final score.
        if questionCount < 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Game Over. Your final score is \(score) out of 10.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
       
        
    }
    
}

