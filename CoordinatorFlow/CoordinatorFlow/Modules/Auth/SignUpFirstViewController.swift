//
//  SignUpFirstViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/6/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SignUpFirstViewController: UIViewController, FlowController {
    var completionHendler: ((_ email: String) -> Void)?

    @IBOutlet var emailField: UITextField!
    @IBOutlet var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionTouchInNextButton(_: UIButton) {
        emailField.endEditing(true)
        completionHendler?(emailField.text ?? "")
    }
}
