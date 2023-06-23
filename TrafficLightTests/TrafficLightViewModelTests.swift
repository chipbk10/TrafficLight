//
//  TrafficLightViewModelTests.swift
//  TrafficLightTests
//
//  Created by Hieu Luong on 23/06/2023.
//

import XCTest
@testable import TrafficLight

final class TrafficLightViewModelTests: XCTestCase {

    // MARK: - Private Constants
    
    private enum Light: Int {
        case red = 0
        case green
        case orange
    }
    
    // MARK: - Private Properties
    
    private let mockCarModel: String = "MockCarModel"
    private let mockRGB: RGB = (red: 0, green: 0, blue: 0, alpha: 0)
    private var mockLightProperties: [LightProperty]!
    
    override func setUp() {
        super.setUp()
        mockLightProperties = [
            setupMockLightProperty(time: 4), // RED
            setupMockLightProperty(time: 4), // GREEN
            setupMockLightProperty(time: 1)  // ORANGE
        ]
    }
    
    /// range [1...4] --> show red light
    func test_observe_givenTimeAtSecond2_shouldShowRedLight() {
        
        // Assign
        let timeMonitor = MockTimeMonitor(currentTime: 2)
        let viewModel = TrafficLightViewModel(carModel: mockCarModel, lightProperties: mockLightProperties, timeMonitor: timeMonitor)
        
        // Act
        viewModel.start()
        
        // Assert
        XCTAssertEqual(Light.red.rawValue, viewModel.currentIndex.value)
    }
    
    /// range [5...8] --> show red light
    func test_observe_givenTimeAtSecond6_shouldShowGreenLight() {
        
        // Assign
        let timeMonitor = MockTimeMonitor(currentTime: 6)
        let viewModel = TrafficLightViewModel(carModel: mockCarModel, lightProperties: mockLightProperties, timeMonitor: timeMonitor)
        
        // Act
        viewModel.start()
        
        // Assert
        XCTAssertEqual(Light.green.rawValue, viewModel.currentIndex.value)
    }
    
    /// range [9...9] --> show red light
    func test_observe_givenTimeAtSecond9_shouldShowOrangeLight() {
        
        // Assign
        let timeMonitor = MockTimeMonitor(currentTime: 9)
        let viewModel = TrafficLightViewModel(carModel: mockCarModel, lightProperties: mockLightProperties, timeMonitor: timeMonitor)
        
        // Act
        viewModel.start()
        
        // Assert
        XCTAssertEqual(Light.orange.rawValue, viewModel.currentIndex.value)
    }
    
    // MARK: - Private Helper Methods
    
    private func setupMockLightProperty(time: Int) -> LightProperty {
        return (activeRGB: mockRGB, inactiveRGB: mockRGB, time: time)
    }

}

struct MockTimeMonitor: TimeMonitoring {
    
    var delegate: TrafficLight.TimeMonitorDelegate?
    var maxTime: Int = 100
    var currentTime: Int
    
    func start() {
        delegate?.observe(currentTime: currentTime)
    }
    func stop() {}
}
