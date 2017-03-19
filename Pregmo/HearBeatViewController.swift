//
//  HearBeatViewController.swift
//  Pregmo
//
//  Created by Deyan Zhekov on 3/19/17.
//  Copyright © 2017 Deyan Zhekov. All rights reserved.
//

import UIKit

class HearBeatViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heartBeatBackgroundImageView: UIImageView!
    @IBOutlet weak var redHeartRotatedImageView: UIImageView!
    @IBOutlet weak var redHeartImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var isHeartBeatPulsing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        startButton.layer.cornerRadius = 4.0
        startButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        let heartImageView = UIImageView(frame: redHeartRotatedImageView.frame)
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.image = redHeartRotatedImageView.image
        
        containerView.addSubview(heartImageView)
        
        redHeartRotatedImageView.isHidden = true
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        
                        self.heartBeatBackgroundImageView.alpha = 0
                        self.startButton.alpha = 0
                        
                    }) { (finished: Bool) in
                        
                        UIView.animate(withDuration: 0.5,
                                       animations: {
                                        
                                        heartImageView.frame = self.redHeartImageView.frame
                                    },
                                       completion: { (finished: Bool) in
                                        
                                        self.redHeartImageView.isHidden = false
                                        self.isHeartBeatPulsing = true
                                        
                                        heartImageView.removeFromSuperview()
                                    })
                    }
    }

}
