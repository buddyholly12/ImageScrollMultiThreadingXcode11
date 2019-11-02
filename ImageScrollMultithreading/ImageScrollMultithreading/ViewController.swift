//
//  ViewController.swift
//  ImageScrollMultithreading
//
//  Created by IOS on 02/11/19.
//  Copyright © 2019 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.animals[identifier]{
                if let imageScrollViewController = segue.destination as? ImageViewController {
                    imageScrollViewController.imageURL = url
                    imageScrollViewController.title = identifier
                    
                }
            }
        }
    }

}

