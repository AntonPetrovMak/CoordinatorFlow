//
//  NumberCoordinator.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/4/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

enum NumberActions {
    case OpenSecond
    case OpenThird
    case Finish
}

struct NumberCoordinator : Coordinatable {
    
    typealias CompletionType = Void
    var flowCompletionHandler: ((CompletionType) -> ())?
    
    let moduleFactory: NumberModulesFactory
    let presenter: UINavigationController?

    init(_ presenter: UINavigationController, _ moduleFactory: NumberModulesFactory) {
        self.presenter = presenter
        self.moduleFactory = moduleFactory
    }

    func start() {
        self.initFirstScene()
    }
    
    private func initFirstScene() {
        
        let oneVC = moduleFactory.oneViewController()
        oneVC.completionHendler = { result in
            switch result {
            case .OpenSecond:
                self.openSecond()
            case .OpenThird:
                self.openThird()
            default:
                break
            }
        }
        setRootModule(oneVC)
    }
    
    private func openSecond() {
        let twoVC = TwoViewController.controllerFromStoryboard(.main)
        twoVC.completionHendler = { result in
            switch result {
            case .Finish:
                self.flowCompletionHandler?(())
            default:
                break
            }
        }
        push(viewController: twoVC, animated: true)
    }
    
    private func openThird() {
        
        let thirdVC = ThirdViewController.controllerFromStoryboard(.main)
        thirdVC.completionHendler = { result in
            switch result {
            case .Finish:
                self.flowCompletionHandler?(())
            default:
                break
            }
        }
        push(viewController: thirdVC, animated: true)
    }

}
