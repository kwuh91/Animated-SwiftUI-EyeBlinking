# SwiftUI Blinking Eye Animation

Welcome to the SwiftUI Blinking Eye Animation project! This project showcases a blinking eye animation with various styles and colors using SwiftUI.

## Showcase

## Eye States / Single Eye Blinking / Multiple Eyes Blinking

<div align="center">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/SingleEyeBlinking.gif" style="width: 65%; alt="SingleEyeBlinking">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/MultipleEyesBlinkingDefault.gif" style="width: 65%; alt="MultipleEyesBlinkingDefault">
</div>

## Variants

You can fully customize the appearance of the eyes, their quantity, size, e.t.c.

<div align="center">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/MultipleEyesBlinkingVisage.gif" style="width: 65%; alt="MultipleEyesBlinkingVisage">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/MultipleEyesBlinkingRed.gif" style="width: 65%; alt="MultipleEyesBlinkingRed">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/MultipleEyesBlinkingNoPupil.gif" style="width: 65%; alt="MultipleEyesBlinkingNoPupil">
  <img src="https://raw.githubusercontent.com/kwuh91/Animated-SwiftUI-EyeBlinking/master/extra/MultipleEyesBlinkingBlue.gif" style="width: 65%; alt="MultipleEyesBlinkingBlue">
</div>

## Installation

To get started with the project, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/Animated-SwiftUI-EyeBlinking.git
    ```

2. Navigate to the project directory:
    ```bash
    cd EYE
    ```

3. Open the project in Xcode:
    ```bash
    open EYE.xcodeproj
    ```

4. Build and run the project on your simulator or device.

## Usage

To customize the blinking eye animation:

1. Open `EYE/Views/Eyes/BlinkingAnimation/MultipleBlinkingEyes.swift`.
2. Modify the parameters in the `MultipleBlinkingEyes` to change the colors, quantity, delay between changing states and intervals for randomizing time between blinking and size.

```swift
struct ContentView: View {
    var body: some View {
        MultipleBlinkingEyes(quantity:     100,
                             mainEyeColor: Color.black,
                             sectorColor:  Color.white,
                             pupilColor:   Color.black,
                             delayBetweenChangingStates: 0.025,
                             intervalForRandomTimeBetweenBlinking: 1...20,
                             intervalForRandomSize: 50...300)
    }
}
```
