//
//  AppCoordinator.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    
    private var carCoordinator: CarCoordinator?
    
    // MARK: - Public Method
    
    func start() -> UIViewController {
        let navigationController = UINavigationController()
        navigateToCarModelScreen(navigationController: navigationController)
        return navigationController
    }
    
    // MARK: - Private Method
    
    private func navigateToCarModelScreen(navigationController: UINavigationController) { // Screen 1
        let coordinator = CarCoordinator(navigationController: navigationController)
        self.carCoordinator = coordinator
        let viewController = coordinator.start()
        navigationController.pushViewController(viewController, animated: false)
    }
}
