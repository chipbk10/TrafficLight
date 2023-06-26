//
//  TimeMonitorUsingDispatchQueue.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation

final class TimeMonitorUsingDispatchQueue: TimeMonitoring {
    
    // MARK: - TimeMonitoring Properties
    
    var delegate: TimeMonitorDelegate?
    var maxTime: Int = 0
    var currentTime: Int = 0
    
    // MARK: - Private Properties
    
    private var shouldStop: Bool = true
    
    // MARK: - TimeMonitoring Methods
    
    func start() {
        shouldStop = false
        startMonitoring()
    }
    
    func stop() {
        shouldStop = true
        currentTime = 0
    }
    
    // MARK: - Private Methods
    
    func startMonitoring() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.0)) { [weak self] in
            guard var self, !self.shouldStop else { return }
            self.notify()
            self.startMonitoring()
        }
    }
}


/// Pros: accurate timing
/// Cons: GCD doesn't have a cancellation API
