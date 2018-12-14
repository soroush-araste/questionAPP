//
//  StartScreenViewController.swift
//  Quizzler
//
//  Created by soroush amini araste on 12/13/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func StartButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "showMainQuizViewController", sender: nil)
    }
    
}
