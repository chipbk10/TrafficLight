//
//  TrafficLightViewController+Observers.swift
//  TrafficLight
//
//  Created by Hieu Luong on 23/06/2023.
//

import Foundation

extension TrafficLightViewController {
         
    func addObservers() {
        addCurrentIndexObserver()
        addCurrentSecondObserver()
    }
    
    func addCurrentIndexObserver() {
        viewModel.currentIndex.addObserver { [weak self] oldIndex, newIndex in
            self?.lightViews[oldIndex].set(active: false, animation: true)
            self?.lightViews[newIndex].set(active: true, animation: true)
        }
    }
    
    func addCurrentSecondObserver() {
        viewModel.currentSecond.addObserver { [weak self] _, currentSecondValue in
            self?.secondLabelView.text = "\(currentSecondValue)"
        }
    }        
    
    func removeObservers() {
        viewModel.currentIndex.removeObserver()
        viewModel.currentSecond.removeObserver()
    }
}
