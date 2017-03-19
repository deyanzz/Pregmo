//
//  EcographyViewController.swift
//  Pregmo
//
//  Created by Deyan Zhekov on 3/19/17.
//  Copyright © 2017 Deyan Zhekov. All rights reserved.
//

import UIKit

class EcographyViewController: UIViewController {

    @IBOutlet weak var preorderNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        preorderNowButton.layer.cornerRadius = 6.0
        preorderNowButton.clipsToBounds = true
        
        preorderNowButton.layer.cornerRadius = 6.0
        preorderNowButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
