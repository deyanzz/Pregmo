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
    @IBOutlet weak var stopButton: UIButton!
    
    var puslingHeartBeat = Pulsator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        startButton.layer.borderColor = UIColor.lightGray.cgColor
        startButton.layer.borderWidth = 2.0
        startButton.layer.cornerRadius = 6.0
        startButton.clipsToBounds = true
        
        stopButton.layer.borderColor = UIColor.lightGray.cgColor
        stopButton.layer.borderWidth = 2.0
        stopButton.layer.cornerRadius = 6.0
        stopButton.clipsToBounds = true
        
        initializePulsingHeartBeat()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.layer.layoutIfNeeded()
        
        puslingHeartBeat.position = redHeartImageView.layer.position
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializePulsingHeartBeat() {
        
        redHeartImageView.layer.superlayer?.insertSublayer(puslingHeartBeat, below: redHeartImageView.layer)
        
        puslingHeartBeat.numPulse = 5
        puslingHeartBeat.radius = 120
        puslingHeartBeat.animationDuration = 5
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
                        
                        self.heartBeatBackgroundImageView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
                        self.heartBeatBackgroundImageView.alpha = 0

                        heartImageView.transform = CGAffineTransform.init(rotationAngle: -0.50)
                        heartImageView.center = self.redHeartImageView.center
                        heartImageView.center.y -= 4
                        
                    }) { (finished: Bool) in
                        
                        self.redHeartImageView.isHidden = false
                        self.stopButton.isHidden = false
                        
                        heartImageView.removeFromSuperview()
                        
                        self.puslingHeartBeat.start()
                    }
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        if !puslingHeartBeat.isPulsating {
            return
        }
        
        self.puslingHeartBeat.stop()
        
        let heartImageView = UIImageView(frame: redHeartImageView.frame)
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.image = redHeartRotatedImageView.image
        
        containerView.addSubview(heartImageView)
        
        self.redHeartImageView.isHidden = true
        self.stopButton.isHidden = true
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        
                        self.heartBeatBackgroundImageView.transform = CGAffineTransform.identity
                        self.heartBeatBackgroundImageView.alpha = 1
                        
                        heartImageView.transform = CGAffineTransform.init(rotationAngle: 0.30)
                        heartImageView.center = self.redHeartRotatedImageView.center
                        
        }) { (finished: Bool) in
            
            self.startButton.isHidden = false
            self.redHeartRotatedImageView.isHidden = false
            
            heartImageView.removeFromSuperview()
        }
    }
}
