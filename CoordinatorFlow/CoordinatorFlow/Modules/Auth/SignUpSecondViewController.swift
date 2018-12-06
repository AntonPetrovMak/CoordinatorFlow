//
//  SignUpSecondViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/6/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SignUpSecondViewController: UIViewController, FlowController {
    var completionHendler: ((_ pass: String) -> Void)?

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionTouchInDoneButton(_: UIButton) {
        passwordField.endEditing(true)
        completionHendler?(passwordField.text ?? "")
    }
}
