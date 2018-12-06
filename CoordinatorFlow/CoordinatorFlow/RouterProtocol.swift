//
//  RouterProtocol.swift
//  CoordinatorFlow
//
//  Created by Petrov Anton on 12/5/18.
//  Copyright © 2018 pam. All rights reserved.
//

import UIKit

protocol Router {
    var presenter: UINavigationController? { get }
    func push(viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)

    func setRootModule(_ viewController: UIViewController)
    func setWindowRoot(_ viewController: UIViewController)
    func present(_ viewController: UIViewController?, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension Router {
    func push(viewController: UIViewController, animated: Bool) {
        presenter?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool) {
        presenter?.popViewController(animated: animated)
    }

    func setWindowRoot(_ viewController: UIViewController) {
        UIApplication.shared.windows.first?.rootViewController = viewController
    }

    func present(_ viewController: UIViewController?, animated: Bool) {
        presenter?.present(viewController!, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        presenter?.dismiss(animated: animated, completion: completion)
    }

    func setRootModule(_ viewController: UIViewController) {
        presenter?.setViewControllers([viewController], animated: false)
    }
}

protocol Coordinatable: Router {
    associatedtype CompletionType
    associatedtype FactoryModuleType
    var moduleFactory: FactoryModuleType { get }
    var flowCompletionHandler: ((CompletionType) -> Void)? { get set }

    init(_ presenter: UINavigationController, _ moduleFactory: FactoryModuleType)
    func start()
}

extension Coordinatable {}

protocol FlowController {
    associatedtype FlowControllerType
    var completionHendler: ((FlowControllerType) -> Void)? { get set }
}
