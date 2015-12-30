# Configurable
Configure objects using block

[![CI Status](http://img.shields.io/travis/Khoa Pham/Configurable.svg?style=flat)](https://travis-ci.org/Khoa Pham/Configurable)
[![Version](https://img.shields.io/cocoapods/v/Configurable.svg?style=flat)](http://cocoapods.org/pods/Configurable)
[![License](https://img.shields.io/cocoapods/l/Configurable.svg?style=flat)](http://cocoapods.org/pods/Configurable)
[![Platform](https://img.shields.io/cocoapods/p/Configurable.svg?style=flat)](http://cocoapods.org/pods/Configurable)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How it works

- Use @noescape to make sure parameter can not outlive the method call
- Does not work well on struct, unless we use `mutating`
- `Configurable` conformance was declared for NSObject
- `Initable` conformance must be explictly declared

## Features

### Configurable

Works on NSObject subclasses

```swift
let button = UIButton(type: .Custom).configure {
    $0.setTitle("Click", forState: .Normal)
    $0.setTitleColor(UIColor.redColor(), forState: .Normal)
}

XCTAssert(button.titleForState(.Normal)! == "Click")
XCTAssert(button.titleColorForState(.Normal)! == UIColor.redColor())
```

Works on custom class

```swift
class Person {
    var name: String?
    var age: Int?

    init() {

    }
}

let person = Person().configure {
    $0.name = "Luke Skywalker"
    $0.age = 17
}

XCTAssert(person.name! == "Luke Skywalker")
XCTAssert(person.age! == 17)
```

### Initable

Works on classes that have `init()`

```swift
extension UILabel: Initable {}

let label = UILabel {
    $0.text = "Fantageek"
}

XCTAssert(label.text == "Fantageek")
```

Works on custom classes

```swift
final class Robot {
    var name: String?
    var cute = false
}
extension Robot: Initable { }

let robot = Robot {
    $0.name = "R2-D2"
    $0.cute = true
}

XCTAssert(robot.name == "R2-D2")
XCTAssert(robot.cute)
```

Custom classes need to be `final`

```swift
final class Robot {
    var name: String?
    var cute = false
}
```

or implement `init()`

```swift
class Robot {
    var name: String?
    var cute = false

    required init() {

    }
}
```

## Installation

Configurable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Configurable"
```

## Author

Khoa Pham, onmyway133@gmail.com

## License

Configurable is available under the MIT license. See the LICENSE file for more info.
