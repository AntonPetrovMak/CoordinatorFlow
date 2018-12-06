//
//  ApplicationCoordinator.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/4/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

enum ApplicationCoordinatorActions {
    case numbers
    case signUp
}

struct ApplicationCoordinator: Coordinatable {
    
    typealias CompletionType = Void
    var flowCompletionHandler: ((CompletionType) -> ())?
    let moduleFactory: ApplicationModulesFactory
    let presenter: UINavigationController?
    
    init(_ presenter: UINavigationController, _ moduleFactory: ApplicationModulesFactory) {
        self.presenter = presenter
        self.moduleFactory = moduleFactory
    }
    
    func start() {
        self.initSplash()
    }
    
    private func initSplash() {
        let splashVC = moduleFactory.splashViewController()
        splashVC.completionHendler = { action in
            switch action {
            case .numbers:
                self.startNumberSequence()
            case .signUp:
                self.startSignUpSequence()
            }
        }
        presenter?.setViewControllers([splashVC], animated: false)
        setWindowRoot(presenter!)
    }
    
    private func startNumberSequence() {
        
        var numberCoordinator = CoordinatorFactory.numberCoordinator()
        numberCoordinator.flowCompletionHandler = { _ in
            numberCoordinator.dismiss(animated: true, completion: nil)
        }
        numberCoordinator.start()
        present(numberCoordinator.presenter, animated: true)
    }
    
    private func startSignUpSequence() {
        
        let signUpCoordinator = CoordinatorFactory.signUpCoordinator()
        signUpCoordinator.flowCompletionHandler = { data in
            signUpCoordinator.dismiss(animated: true, completion: {
                let alert = UIAlertController.init(title: "info", message: "Email: \(String(describing: data.email)) \nPassword: \(String(describing: data.password))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            })
        }
        signUpCoordinator.start()
        present(signUpCoordinator.presenter, animated: true)
    }
    
    
}
