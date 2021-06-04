//
//  ScoreViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 04/06/21.
//

import UIKit

class ScoreViewController: UIViewController {

 
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var pontos = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pontoString = String(pontos)
        scoreLabel.text  = "\(pontoString) / 5"
        
        if pontos > 3 {
            messageLabel.text = "Parabéns!"
        }; if pontos == 3 {
            messageLabel.text = "Muito bem!"
        }; if pontos < 3 {
            messageLabel.text = "Vamos tentar outra vez?"
        }
    
        
        
    }
    



}
