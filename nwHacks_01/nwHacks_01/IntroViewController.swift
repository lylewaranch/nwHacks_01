//
//  IntroViewController.swift
//  nwHacks_01
//
//  Created by Lyle Waranch on 1/13/18.
//  Copyright © 2018 Lyle Waranch. All rights reserved.
//

import UIKit
import TransitionButton

class IntroViewController: UIViewController {
    var didSucceed = false
    
    @IBOutlet weak var verifyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyButton.layer.cornerRadius = 5
        if (didSucceed == false) {
            verifyButton.backgroundColor = UIColor.red
        } else {
            verifyButton.backgroundColor = UIColor.green
        }
    }
}
