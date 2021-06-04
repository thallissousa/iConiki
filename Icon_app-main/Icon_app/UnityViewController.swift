//
//  SecondViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 03/06/21.
//

import UIKit

class UnityViewController: UIViewController {
    
    @IBOutlet weak var mybutton: UIButton!
    @IBOutlet weak var mytextField: UITextView!
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mytextField)
        
        view.addSubview(mybutton)
        mybutton.backgroundColor = .systemBlue
        mybutton.layer.cornerRadius = 25
        mybutton.tintColor = .white
        
        myImage.image = UIImage(named: "unidade")
        view.addSubview(myImage)

    }
    
    
    }
