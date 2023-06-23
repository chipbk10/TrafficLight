//
//  CircleView.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class CircleView: UIView {
            
    // MARK: - Private Properties
    
    private let activeColor: UIColor
    private let inactiveColor: UIColor
    private let delay: Double
    
    // MARK: - Init
    
    init(property: LightProperty) {
        self.activeColor = UIColor(red: property.activeRGB.red, green: property.activeRGB.green, blue: property.activeRGB.blue, alpha: property.activeRGB.alpha)
        self.inactiveColor = UIColor(red: property.inactiveRGB.red, green: property.inactiveRGB.green, blue: property.inactiveRGB.blue, alpha: property.inactiveRGB.alpha)        
        self.isActive = false
        self.delay = Double(property.time)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) var isActive: Bool = false 
        
    
    // MARK: - Public Methods
    
    func set(active: Bool, animation: Bool) {
        isActive = active
        animation ? updateBackgroundColorWithAnimation() : updateBackgroundColor()
    }
    
    func setActiveOn(duration: Double = 0.3, completion: @escaping (Bool) -> Void) {
                        
        set(active: true, animation: true)
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.set(active: false, animation: false)
        } completion: { success in            
            completion(success)
        }
    }
    
    func stopAnimation() {
        layer.removeAllAnimations()
    }
    
    // MARK: - Private Method
    
    private func updateBackgroundColor() {
        self.backgroundColor = self.isActive ? self.activeColor : self.inactiveColor
        self.layer.borderWidth = self.isActive ? 4.0 : 0.0
    }
    
    private func updateBackgroundColorWithAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.updateBackgroundColor()
        }
    }
    
    // MARK: - LifeCycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.bounds.width / 2
        clipsToBounds = true
        layer.borderColor = CGColor(red: 54/255, green: 124/255, blue: 70/255, alpha: 1.0)
    }
    
}
