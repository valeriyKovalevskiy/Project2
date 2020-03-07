//
//  ViewController.swift
//  Project2
//
//  Created by Valeriy Kovalevskiy on 3/6/20.
//  Copyright © 2020 v.kovalevskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstFlagButton: UIButton!
    @IBOutlet weak var secondFlagButton: UIButton!
    @IBOutlet weak var thirdFlagButton: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        firstFlagButton.layer.borderWidth = 1
        secondFlagButton.layer.borderWidth = 1
        thirdFlagButton.layer.borderWidth = 1
        
        firstFlagButton.layer.borderColor = UIColor.lightGray.cgColor
        secondFlagButton.layer.borderColor = UIColor.lightGray.cgColor
        thirdFlagButton.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        firstFlagButton.setImage(UIImage(named: countries[0]), for: .normal)
        secondFlagButton.setImage(UIImage(named: countries[1]), for: .normal)
        thirdFlagButton.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].capitalized
    }
    
    //MARK: - Actions
    
    @IBAction func flagButtonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct!"
        } else {
            title = "Wrong!"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
}

