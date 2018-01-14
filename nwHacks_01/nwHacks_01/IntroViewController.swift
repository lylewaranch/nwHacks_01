//
//  IntroViewController.swift
//  nwHacks_01
//
//  Created by Lyle Waranch on 1/13/18.
//  Copyright © 2018 Lyle Waranch. All rights reserved.
//

import UIKit
import TransitionButton
import ButtonProgressBar_iOS

class IntroViewController: UIViewController {
    var didSucceed = false
    var hasVerified = false
    var progressButton: ButtonProgressBar!
    
    @objc func tapped() {
        let time = 2.0
        let padding = 0.5
        progressButton.setProgressColor(color: UIColor(red: 0/255, green: 140/255, blue: 245/255, alpha: 1.0))
        progressButton.startIndeterminate(withTimePeriod: time, andTimePadding: padding)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.performSegue(withIdentifier: "showCamera", sender: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressButton = ButtonProgressBar(frame: CGRect(x: 0, y: 500, width: self.view.frame.width*0.45, height: 60))
        progressButton.center.x = self.view.center.x
        progressButton.addTarget(nil, action: #selector(self.tapped), for: .touchUpInside)
        progressButton.setTitle("Verify", for: .normal)
        self.view.addSubview(progressButton)
        if (hasVerified == true) {
            if (didSucceed == false) {
                progressButton.setCompletionImage(image: UIImage(named: "x")!)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.progressButton.setProgressColor(color: UIColor.red)
                    self.progressButton.triggerCompletion()
                })
            } else if (didSucceed == true) {
                progressButton.setCompletionImage(image: UIImage(named: "checkmark")!)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.progressButton.setProgressColor(color: UIColor.green)
                    self.progressButton.triggerCompletion()
                })
            }
        }
    }
}
