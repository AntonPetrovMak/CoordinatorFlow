//
//  TwoViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/4/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController, FlowController {
    
    typealias FlowControllerType = NumberActions
    var completionHendler: ((NumberActions) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectFinishButton(sender: UIButton) {
        completionHendler?(.Finish)
    }
    

}
