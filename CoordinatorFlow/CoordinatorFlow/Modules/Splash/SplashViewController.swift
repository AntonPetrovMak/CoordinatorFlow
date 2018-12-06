//
//  SplashViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, FlowController {
    var completionHendler: ((ApplicationCoordinatorActions) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectStartButton(sender _: UIButton) {
        completionHendler?(.numbers)
    }

    @IBAction func selectsignUpButton(sender _: UIButton) {
        completionHendler?(.signUp)
    }
}
