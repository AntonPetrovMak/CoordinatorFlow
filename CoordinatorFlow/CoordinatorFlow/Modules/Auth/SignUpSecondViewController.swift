//
//  SignUpSecondViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/6/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SignUpSecondViewController: UIViewController, FlowController {
    
    var completionHendler: ((_ pass: String) ->())?
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionTouchInDoneButton(_ sender: UIButton) {
        passwordField.endEditing(true)
        completionHendler?(passwordField.text ?? "")
    }
}
