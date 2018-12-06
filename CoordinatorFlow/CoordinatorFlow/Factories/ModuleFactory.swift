//
//  ModuleFactory.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

protocol ApplicationModulesFactory {
    func splashViewController() -> SplashViewController
}

protocol NumberModulesFactory {
    func oneViewController() -> OneViewController
    func twoViewController() -> TwoViewController
    func thirdViewController() -> ThirdViewController
}

protocol SignUpModulesFactory {
    func signUpFirstViewController() -> SignUpFirstViewController
    func signUpSecondViewController() -> SignUpSecondViewController
}

struct ModuleFactory: NumberModulesFactory, ApplicationModulesFactory, SignUpModulesFactory {
    
    // MARK: - SignUpModulesFactory
    
    func signUpFirstViewController() -> SignUpFirstViewController {
        return SignUpFirstViewController.controllerFromStoryboard(.auth)
    }
    
    func signUpSecondViewController() -> SignUpSecondViewController {
        return SignUpSecondViewController.controllerFromStoryboard(.auth)
    }
    
    // MARK: - ApplicationModulesFactory
    
    func splashViewController() -> SplashViewController {
        return SplashViewController.controllerFromStoryboard(.main)
    }
    
    
    // MARK: - NumberModulesFactory

    func oneViewController() -> OneViewController {
        return OneViewController.controllerFromStoryboard(.main)
    }
    
    func twoViewController() -> TwoViewController {
        return TwoViewController.controllerFromStoryboard(.main)
    }
    
    func thirdViewController() -> ThirdViewController {
        return ThirdViewController.controllerFromStoryboard(.main)
    }
    

}
