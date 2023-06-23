
# Traffic Light

## Requirements

Create a traffic light system:
- Create an app that has 2 screens.
- On the first screen there is one textview which asks your car model and and a button "Start Driving" which leads to the second screen.
- Add a validation check on the car model for a minimum length of 3.
- Pass the car model name to the second screen
- On the second screen the car model is displayed at the top and below it are 3 circles aligned vertically: RED, ORANGE and GREEN. 
- The color intensity of the circles should change to which light is active. They should act like a real traffic light:
    - RED – 4 seconds bright
    - GREEN – 4 seconds bright
    - ORANGE – 1 second bright
- The lights should quickly fade when turned on or off.
- This is a classic traffic light: Green → Orange → Red, Red → Green.

## Solution

### UIView.animate approach
- animate with `duration` & `delay` time

### Time monitor approach
- observe the passage of time every second
    - if the time is in range [1...4] seconds, then we should show `RED LIGHT`
    - if the time is in range [5...8] seconds, then we should show `GREEN LIGHT`
    - if the time is in range [9...9] seconds, then we should show `ORANGE LIGHT`
    
## Generalize
- We do not limit the number of colors to 3 (red, green, light)
- We can add many colors that we want.

## Architecture

- use `UIKit`
- use `MVVM-C`

## Unit Tests

### Validate CarModel

- cover the cases:
    - `CarModel` is empty ==> invalid
    - length of `CarModel` < 3 ==> invalid
    - length of `CarModel` >= 3 ==> valid

### Light Traffic

- cover the cases above:
    - [1...4] -> `RED LIGHT`
    - [5...8] -> `GREEN LIGHT`
    - [9...9] -> `ORANGE LIGHT`
