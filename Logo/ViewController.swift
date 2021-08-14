//
//  ViewController.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var letterstack1: UIStackView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var answerLetterStack: UIStackView!
    
    var gameViewModel: GameViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameViewModel = GameViewModel()
        gameViewModel?.startGame()
        // Do any additional setup after loading the view.
    }
    
    func checkAnswer() {
        gameViewModel?.checkAnswer()
    }
    
    

}

