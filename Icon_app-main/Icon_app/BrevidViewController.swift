//
//  BrevidViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 04/06/21.
//

import UIKit

class BrevidViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTextField)
        
        
        myButton.backgroundColor = .systemBlue
        myButton.layer.cornerRadius = 25
        myButton.tintColor = .white
        view.addSubview(myButton)
        
        myImage.image = UIImage(named: "brevidade")
        view.addSubview(myImage)

    }


}
