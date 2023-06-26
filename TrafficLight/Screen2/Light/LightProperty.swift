//
//  LightProperty.swift
//  TrafficLight
//
//  Created by Hieu Luong on 22/06/2023.
//

import Foundation
import UIKit

typealias RGB = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

typealias LightProperty = (activeRGB: RGB, inactiveRGB: RGB, time: Int)

let redLightProperty: LightProperty = (
    activeRGB: (red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0),
    inactiveRGB: (red: 255/255, green: 211/255, blue: 211/255, alpha: 1.0),
    time: 4
)

let greenLightProperty: LightProperty = (
    activeRGB: (red: 45/255, green: 0/255, blue: 249/255, alpha: 1.0),
    inactiveRGB: (red: 111/255, green: 155/255, blue: 252/255, alpha: 1.0), // (red: 211/255, green: 202/255, blue: 249/255, alpha: 1.0),
    time: 4
)

let orangeLightProperty: LightProperty = (
    activeRGB: (red: 250/255, green: 255/255, blue: 0/255, alpha: 1.0),
    inactiveRGB: (red: 254/255, green: 255/255, blue: 198/255, alpha: 0.5),
    time: 1
)

let grayColor: RGB = (red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)

/// Add more colors if we want
let purpleLightProperty: LightProperty = (
    activeRGB: (red: 140/255, green: 112/255, blue: 255/255, alpha: 1.0),
    inactiveRGB: (red: 140/255, green: 112/255, blue: 255/255, alpha: 0.5),
    time: 3
)
