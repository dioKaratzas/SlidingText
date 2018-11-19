# SlidingText for Swift

[![Version](https://img.shields.io/cocoapods/v/SlidingText.svg?style=flat)](https://cocoapods.org/pods/SlidingText)
[![License](https://img.shields.io/cocoapods/l/SlidingText.svg?style=flat)](https://cocoapods.org/pods/SlidingText)
[![Platform](https://img.shields.io/cocoapods/p/SlidingText.svg?style=flat)](https://cocoapods.org/pods/SlidingText)

<h3 align="center">
<img src="https://image.ibb.co/i1TR5a/Sliding_Text.gif"/>
</h3>

## Requirements
__Requires iOS 8 or later and Xcode 6.1+__<br/>

## Installation

SlidingText is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SlidingText'
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

Dionysis Karatzas, dkaratzas@hotmail.com

## License

Copyright 2018 Dionysios Karatzas

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
