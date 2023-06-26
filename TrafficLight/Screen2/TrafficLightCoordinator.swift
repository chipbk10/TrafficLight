//
//  TrafficLightCoordinator.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class TrafficLightCoordinator {
        
    // MARK: - Private Properties
    
    private let carModel: String
    private let completion: () -> Void
    
    // MARK: - Init
    
    init(carModel: String, completion: @escaping () -> Void) {
        self.carModel = carModel
        self.completion = completion
    }
    
    // MARK: - Public Methods
    
    func start() -> UIViewController {
        let lightProperties = [
            redLightProperty,
            greenLightProperty,
            orangeLightProperty            
        ]
        
        let timeMonitor: TimeMonitoring
                 = TimeMonitorUsingTimer()
                // = TimeMonitorUsingDispatchQueue()
                // = TimerMonitorUsingCombine()
        
        let viewModel = TrafficLightViewModel(
            carModel: carModel,
            lightProperties: lightProperties,
            timeMonitor: timeMonitor
        )
        return TrafficLightViewController(viewModel: viewModel, completion: completion)        
    }
}
