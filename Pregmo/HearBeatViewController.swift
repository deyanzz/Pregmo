//
//  HearBeatViewController.swift
//  Pregmo
//
//  Created by Deyan Zhekov on 3/19/17.
//  Copyright © 2017 Deyan Zhekov. All rights reserved.
//

import UIKit
import Pulsator

class HearBeatViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heartBeatBackgroundImageView: UIImageView!
    @IBOutlet weak var redHeartRotatedImageView: UIImageView!
    @IBOutlet weak var redHeartImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var puslingHeartBeat: Pulsator = Pulsator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initializePulsingHeartBeat()
        
        startButton.layer.cornerRadius = 4.0
        startButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializePulsingHeartBeat() {
        
//        puslingHeartBeat = Pulsator(layer: redHeartImageView.layer)
        
        redHeartImageView.superview?.layer.insertSublayer(puslingHeartBeat, below: redHeartImageView.layer)
        
        puslingHeartBeat.numPulse = 5
        puslingHeartBeat.repeatCount = .greatestFiniteMagnitude
        puslingHeartBeat.radius = 150
        puslingHeartBeat.pulseInterval = 0.1
        puslingHeartBeat.instanceDelay = 0
        puslingHeartBeat.backgroundColor = UIColor.init(colorLiteralRed: 244/255.0,
                                                        green: 122/255.0,
                                                        blue: 131/255.0,
                                                        alpha: 1.0).cgColor
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        let heartImageView = UIImageView(frame: redHeartRotatedImageView.frame)
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.image = redHeartRotatedImageView.image
        
        containerView.addSubview(heartImageView)
        
        redHeartRotatedImageView.isHidden = true
        startButton.isHidden = true
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        
                        self.heartBeatBackgroundImageView.alpha = 0

                        heartImageView.transform = CGAffineTransform.init(rotationAngle: -0.50)
                        heartImageView.center = self.redHeartImageView.center
                        heartImageView.center.y -= 4
                        
                    }) { (finished: Bool) in
                        
                        self.redHeartImageView.isHidden = false
                        
                        heartImageView.removeFromSuperview()
                        
                        self.puslingHeartBeat.start()
                    }
    }

}
