//
//  TrafficLightViewController+StartStop.swift
//  TrafficLight
//
//  Created by Hieu Luong on 23/06/2023.
//

import UIKit

extension TrafficLightViewController {
    
    func start() {
        // using UIView.animate approach
        viewModel.currentIndex.removeObserver()
        startAnimateLightView(atIndex: 0)
        
        // time monitoring approach
        viewModel.start()
    }
    
    func stop() {
        
        // using UIView.animate approach
        stopAnimateLightViews()
        
        // time monitoring approach
        viewModel.stop()
    }
}

// MARK: - Simple UIView.animate approach

extension TrafficLightViewController {
    
    func startAnimateLightView(atIndex index: Int) {
        
        lightViews[index].setActiveOn(duration: 0) { [weak self] success in
            guard let self, success else { return }
            self.startAnimateLightView(atIndex: self.viewModel.next(currentIndex: index))
        }
    }
    
    func stopAnimateLightViews() {
        lightViews.forEach { $0.stopAnimation() }
    }
}
