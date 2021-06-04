//
//  GameViewController3.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 04/06/21.
//

import UIKit

class GameViewController3: UIViewController {

    struct imageProperties {
        let name: String
        let answer: String
    }
    
    let imgSet: [imageProperties] = [
        imageProperties(name: "align1", answer: "errado"),
        imageProperties(name: "align22", answer: "errado"),
        imageProperties(name: "align3", answer: "errado"),
        imageProperties(name: "align4", answer: "correto"),
        imageProperties(name: "align5", answer: "correto")
    ]

    @IBOutlet weak var imageShow: UIImageView!

    
    var position = 0
    var score = 0
    
    
    @IBAction func correctButton(_ sender: UIButton) {
        
        if position < imgSet.count {
            imageShow.image = UIImage(named: imgSet[position].name)
            imageShow.adjustsImageSizeForAccessibilityContentSizeCategory = true
            imageShow.contentMode = .scaleAspectFit
            if imgSet[position].answer == "correto" {
                score = score + 1
            }
            position = position + 1
        }else{
            position = 0
            performSegue(withIdentifier: "score", sender: nil)
        }
        

        
    }
    
    @IBAction func wrongButton(_ sender: UIButton) {
        if position < imgSet.count {
            imageShow.image = UIImage(named: imgSet[position].name)
            imageShow.adjustsImageSizeForAccessibilityContentSizeCategory = true
            imageShow.contentMode = .scaleAspectFit
            if imgSet[position].answer == "errado" {
                score = score + 1
            }
            position = position + 1
        }else{
            position = 0
            performSegue(withIdentifier: "score", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageShow.image = UIImage(named: "tutorial")
        imageShow.contentMode = .scaleAspectFit

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VCDestino: ScoreViewController = segue.destination as! ScoreViewController
        VCDestino.pontos = score
    }

}
