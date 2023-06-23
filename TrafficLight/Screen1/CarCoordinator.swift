//
//  CarCoordinator.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class CarCoordinator {
    
    // MARK: - Private Properties
    
    private let navigationController: UINavigationController
    private var trafficLightCoordinator: TrafficLightCoordinator?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public Method
    
    func start() -> UIViewController {
        let viewModel = CarViewModel()
        let viewController = CarViewController(viewModel: viewModel) { [weak self] carModel in
            self?.navigateToTrafficLightScreen(withCarModel: carModel)
        }
        return viewController
    }
    
    // MARK: - Private Method
    
    private func navigateToTrafficLightScreen(withCarModel carModel: String) {        
        let coordinator = TrafficLightCoordinator(carModel: carModel) { [weak self] in
            self?.navigationController.popViewController(animated: true)
            self?.trafficLightCoordinator = nil
        }
        self.trafficLightCoordinator = coordinator
        let viewController = coordinator.start()
        navigationController.pushViewController(viewController, animated: true)
    }
}
