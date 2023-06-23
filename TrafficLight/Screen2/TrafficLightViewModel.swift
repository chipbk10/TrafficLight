//
//  TrafficLightViewModel.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import Foundation

final class TrafficLightViewModel {    
    
    // MARK: - Public Properties
    
    /// either use observer & listener approach
    /// or use reactive approach (like RxSwift, Combine)
    var currentIndex: Observable<Int> = Observable(0)
    var currentSecond: Observable<Int> = Observable(0)
    
    // MARK: - Private Properties
    
    let carModel: String
    let lightProperties: [LightProperty]
    var times: [Int] = []    
    var timeMonitor: TimeMonitoring
            
    // MARK: - Init
    
    init(carModel: String, lightProperties: [LightProperty], timeMonitor: TimeMonitoring) {
        self.carModel = carModel
        self.lightProperties = lightProperties
        self.timeMonitor = timeMonitor
        self.timeMonitor.delegate = self
        setupTimes()
    }
    
    // MARK: - Public Methods        
    
    func start() {
        print("Start Traffic Light")
        timeMonitor.start()
    }
    
    func stop() {
        print("Stop Traffic Light")
        timeMonitor.stop()
    }
    
    func next(currentIndex: Int) -> Int {
        return currentIndex+1 == lightProperties.count ? 0 : currentIndex+1
    }
    
    // MARK: - Private Methods
    
    private func setupTimes() {
        var amountTime = 0
        lightProperties.forEach {
            amountTime += $0.time
            times.append(amountTime)
        }
        timeMonitor.maxTime = amountTime
    }
}

extension TrafficLightViewModel: TimeMonitorDelegate {
    
    func observe(currentTime: Int) {
        
        print("currentTime = \(currentTime)")
        if let foundIndex = times.firstIndex(where: { currentTime <= $0 }) {
            
            print("foundIndex = \(foundIndex)")
            currentIndex.value = foundIndex
            
            let previousTime = (foundIndex > 0) ? times[foundIndex-1] : 0
            currentSecond.value = currentTime - previousTime
        }
        
    }
}
