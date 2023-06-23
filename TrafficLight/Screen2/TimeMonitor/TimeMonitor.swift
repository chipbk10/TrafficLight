//
//  TimeMonitor.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation
 
protocol TimeMonitorDelegate: AnyObject {
    func observe(currentTime: Int)
}

protocol TimeMonitoring {
    var delegate: TimeMonitorDelegate? { get set }
    var maxTime: Int { get set }
    var currentTime: Int { get set }
    func start()
    func stop()
}

extension TimeMonitoring {
    mutating func notify() {
        currentTime += 1
        if currentTime > maxTime { currentTime = 1 }
        delegate?.observe(currentTime: currentTime)
    }
}
