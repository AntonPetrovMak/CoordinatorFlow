//
//  ThirdViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, FlowController {
    
    typealias FlowControllerType = NumberActions
    var completionHendler: ((NumberActions) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectFinishButton(sender: UIButton) {
        completionHendler?(.Finish)
    }
    
    
}
