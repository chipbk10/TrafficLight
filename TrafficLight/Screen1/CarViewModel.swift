//
//  CarViewModel.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

struct CarViewModel {
    
    // MARK: - Public Properties
    
    let invalidCarModelMessage: String = "Car Model should be at least 3 letters"
    
    // MARK: - Public Methods
    
    func isValid(carModel: String) -> Bool {
        carModel.count >= 3
    }
}
