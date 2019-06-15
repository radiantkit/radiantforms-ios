<h3 align="center">RadiantForms</h3>

---

[![Build Status](https://travis-ci.org/neoneye/SwiftyFORM.svg?branch=master)](https://travis-ci.org/neoneye/SwiftyFORM)
[![Version](https://img.shields.io/cocoapods/v/SwiftyFORM.svg?style=flat)](http://cocoapods.org/pods/SwiftyFORM)
[![License](https://img.shields.io/cocoapods/l/SwiftyFORM.svg?style=flat)](http://cocoapods.org/pods/SwiftyFORM)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyFORM.svg?style=flat)](http://cocoapods.org/pods/SwiftyFORM)


**RadiantForms is an iOS framework for creating forms.**

Because form code is hard to write, hard to read, hard to reason about. Has a slow turn around time. Is painful to maintain.

[SwiftyFORM demo on YouTube](https://youtu.be/PKbVJ91uQdA)

Development happens in the [`develop`](https://github.com/radiantkit/radiantforms-ios/tree/develop) branch.


<a href="mailto:neoneye@gmail.com?subject=Hire Simon Strandgaard">
<img src="Documentation/hire_simon_strandgaard@2x.png" width="211" height="34"></a>


## Requirements

- iOS 10.0+
- Xcode 10.2.1+
- Swift 5.0+


## Features

- [x] Several form items, such as textfield, buttons, sliders
- [x] Some form items can expand/collapse, such as datepicker, pickerview
- [x] You can create your own custom form items
- [x] Align textfields across multiple rows
- [x] Form validation rule engine
- [x] Shows with red text where there are problems with validation
- [x] Strongly Typed
- [x] Pure Swift
- [x] No 3rd party dependencies


# USAGE

### Tutorial 0 - Static text

```swift
import RadiantForms

class Tutorial0_StaticText_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFStaticTextFormItem().title("Hello").value("World")
	}
}
```

### Tutorial 1 - TextField

```swift
import RadiantForms

class Tutorial1_TextField_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFTextFieldFormItem().title("Email").placeholder("Please specify").keyboardType(.emailAddress)
	}
}
```

### Tutorial 2 - Open child view controller

```swift
import RadiantForms

class Tutorial2_ChildViewController_ViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder += RFViewControllerFormItem().title("Go to view controller").viewController(FirstViewController.self)
	}
}
```


# INSTALLATION

## CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `RadiantForms` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'RadiantForms'
```

Then, run the following command:

```bash
$ pod install
```

# Communication

- If you want to contribute, submit a pull request.
- If you found a bug, have suggestions or need help, please, open an issue.
- If you need help, write me: neoneye@gmail.com
- If you want to [give me](https://www.paypal.me/SimonStrandgaard) some motivation ;-)

