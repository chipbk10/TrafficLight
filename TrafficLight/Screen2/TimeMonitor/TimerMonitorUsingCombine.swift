//
//  TimerMonitorUsingCombine.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation
import Combine

final class TimerMonitorUsingCombine: TimeMonitoring {
    
    // MARK: - TimeMonitoring Properties
    
    var delegate: TimeMonitorDelegate?
    var maxTime: Int = 0
    var currentTime: Int = 0
    
    // MARK: - Private Properties
    
    private var publisher: AnyCancellable?
    
    // MARK: - TimeMonitoring Methods
    
    func start() {
        publisher = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard var self else { return }
                self.notify()
            }            
    }
    
    func stop() {
        publisher?.cancel()
        currentTime = 0
    }
}
