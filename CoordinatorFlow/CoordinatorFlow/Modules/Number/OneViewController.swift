//
//  OneViewController.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/4/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class OneViewController: UIViewController, FlowController {
    typealias FlowControllerType = NumberActions
    var completionHendler: ((NumberActions) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectSecondButton(sender: UIButton) {
        completionHendler?(.OpenSecond)
    }
    
    @IBAction func selectThirdButton(sender: UIButton) {
        completionHendler?(.OpenThird)
    }

}
