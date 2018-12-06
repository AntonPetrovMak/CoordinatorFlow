//
//  SplashViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, FlowController {
    
    var completionHendler: ((ApplicationCoordinatorActions) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectStartButton(sender: UIButton) {
        completionHendler?(.numbers)
    }
    
    @IBAction func selectsignUpButton(sender: UIButton) {
        completionHendler?(.signUp)
    }

}
