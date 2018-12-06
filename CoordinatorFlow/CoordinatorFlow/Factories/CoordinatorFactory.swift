//
//  CoordinatorFactory.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

struct CoordinatorFactory {
    static func applicationCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(UINavigationController(), ModuleFactory())
    }

    static func numberCoordinator() -> NumberCoordinator {
        let nc = UINavigationController()
        let numberCoordinator = NumberCoordinator(nc, ModuleFactory())
        return numberCoordinator
    }

    static func signUpCoordinator() -> SignUpCoordinator {
        let nc = UINavigationController()
        let signUpCoordinator = SignUpCoordinator(nc, ModuleFactory())
        return signUpCoordinator
    }
}
