//
//  SignUpCoordinator.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/6/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

class SignUpCoordinator: Coordinatable {

    let presenter: UINavigationController?
    let moduleFactory: SignUpModulesFactory
    var flowCompletionHandler: (((email: String?, password: String?)) -> ())?
    
    required init(_ presenter: UINavigationController,_ moduleFactory: SignUpModulesFactory) {
        self.presenter = presenter
        self.moduleFactory = moduleFactory
    }
    
    func start() {
        self.initFirstScene()
    }
    
    // MARK: -
    
    private var email: String = ""
    private var password: String = ""
    
    private func initFirstScene() {
        let vc = moduleFactory.signUpFirstViewController()
        vc.completionHendler = { [weak self] (someEmail) in
            self?.email = someEmail
            self?.initSecondScene()
        }
        setRootModule(vc)
    }
    
    private func initSecondScene() {
        let vc = moduleFactory.signUpSecondViewController()
        vc.completionHendler = { [weak self] (somePass) in
            self?.password = somePass
            self?.flowCompletionHandler?((self?.email, self?.password))
        }
        push(viewController: vc, animated: true)
    }
}
