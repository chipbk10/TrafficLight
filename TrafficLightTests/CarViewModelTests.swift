//
//  CarViewModelTests.swift
//  TrafficLightTests
//
//  Created by Hieu Luong on 23/06/2023.
//

import XCTest
@testable import TrafficLight

final class CarViewModelTests: XCTestCase {
    
    func test_isValid_givenEmptyCarModel_shouldReturnFalse() {
        
        // Assign
        let carModel = ""
        let viewModel = CarViewModel()
        
        // Act
        let isValidCarModel = viewModel.isValid(carModel: carModel)
        
        // Assert
        XCTAssertFalse(isValidCarModel)
    }
    
    func test_isValid_givenCarModel_withLengthSmallerThan3_shouldReturnFalse() {
        
        // Assign
        let carModel = "AB"
        let viewModel = CarViewModel()
        
        // Act
        let isValidCarModel = viewModel.isValid(carModel: carModel)
        
        // Assert
        XCTAssertFalse(isValidCarModel)
    }
    
    func test_isValid_givenCarModel_withLengthGreaterThan3_shouldReturnTrue() {
        
        // Assign
        let carModel = "ABCD"
        let viewModel = CarViewModel()
        
        // Act
        let isValidCarModel = viewModel.isValid(carModel: carModel)
        
        // Assert
        XCTAssertTrue(isValidCarModel)
    }

}
