//
//  TimeMonitorUsingTimer.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation

final class TimeMonitorUsingTimer: TimeMonitoring {
    
    // MARK: - TimeMonitoring Properties
    
    weak var delegate: TimeMonitorDelegate?
    var maxTime: Int = 0
    var currentTime: Int = 0
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    
    // MARK: - TimeMonitoring Methods
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard var self else {
                timer.invalidate()
                return
            }
            self.notify()
        }
    }
    
    func stop() {
        timer?.invalidate()
    }         
}

/// Pros: can invalidate the timer
/// Cons: might be not accurate in timing
