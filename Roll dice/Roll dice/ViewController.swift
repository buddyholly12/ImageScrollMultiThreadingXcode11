//
//  ViewController.swift
//  Roll dice
//  Created by Andreas Prasetyo on 18/09/19.
//  Copyright © 2019 Andreas Prasetyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        IMG1.image = UIImage(named:"dice-one")
        IMG2.image = UIImage(named:"dice-two")
    }
    let dice = ["dice-one","dice-two","dice-three","dice-four","dice-five","dice-six"] // isi Dice 

    @IBOutlet weak var IMG1: UIImageView!
    @IBOutlet weak var IMG2: UIImageView!
   
    // random the dice 
    @IBAction func Push(_ sender: UIButton) {
        IMG1.image = UIImage(named: dice[Int(arc4random_uniform(6))])
        IMG2.image = UIImage(named: dice[Int(arc4random_uniform(6))])
        
        if IMG1.image == IMG2.image{
            let alert = UIAlertController(title: "Warning!!", message: "Dadu Kembar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("OK")
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }}))
            self.present(alert, animated: true, completion: nil)        }
        else {
            IMG1.image = UIImage(named: dice[Int(arc4random_uniform(6))])
            IMG2.image = UIImage(named: dice[Int(arc4random_uniform(6))])
            
        }
        // check dadu apa ada yang kembar
    }// Random Dice
    
}

