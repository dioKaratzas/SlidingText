# Sliding Text for Swift 3
<h3 align="center">
<img src="https://image.ibb.co/i1TR5a/Sliding_Text.gif"/>
</h3>

## Introduction
__Requires iOS 8 or later and Xcode 6.1+__<br/>

## Installation
### Manually (~10 seconds)

1. Download and drop 'SlidingText.swift' in your project.  
2. Congratulations!

### Install via CocoaPods (~10 seconds)
SlidingText is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform :ios, '8.0'
use_frameworks!
pod "SlidingText"
```

## Usage with Storyboard
In Identity Inspector, connect the UIView to SlidingText Class and set the properties in Attribute Inspector.

<img src="https://image.ibb.co/dJ8Jka/Sliding_Text.png"/>
```
Text is separated by the '|n' delimiter
```

<img src="https://image.ibb.co/dyQdJv/Sliding_Text.png"/>

## Usage with Code
```swift
let slidingText = SlidingText(frame: CGRect(x: 0, y: 30, width: self.view.frame.width, height: 120))

myAwesomeViewController.view.addSubView = slidingText

...

```

## Functions
    start()
    pause()

## Properties
    labelColor
    labelFont
    labelSize
    slidingTexts
    pagerTintColor
    pagerCurrentColor
    timeToSlide
    enableGestures
    isPaused (Get)
    currentIndex (Get)

## Author
This control has been open-sourced by [Dionysis Karatzas](mailto:dkaratzas@hotmail.com). You can hire him for freelance projects, [here](mailto:dkaratzas@hotmail.com).

## License & Other Boring Stuff
SlidingText is released under the MIT license. See LICENSE for details. If you use the control somewhere, [do let me know](mailto:dkaratzas@hotmail.com). I'd love to see it out in the wild.
