//
//  ConfigurableTest.swift
//  Configurable
//
//  Created by Khoa Pham on 12/30/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import XCTest
import UIKit
import Configurable

class Person {
    var name: String?
    var age: Int?

    init() {

    }
}

extension Person: Configurable {}

class ConfigurableTests: XCTestCase {
    func testNSObject() {
        let button = UIButton(type: .Custom).configure {
            $0.setTitle("Click", forState: .Normal)
            $0.setTitleColor(UIColor.redColor(), forState: .Normal)
        }

        XCTAssert(button.titleForState(.Normal)! == "Click")
        XCTAssert(button.titleColorForState(.Normal)! == UIColor.redColor())
    }

    func testClass() {
        let person = Person().configure {
            $0.name = "Luke Skywalker"
            $0.age = 17
        }

        XCTAssert(person.name! == "Luke Skywalker")
        XCTAssert(person.age! == 17)
    }

    func testFreeFunction() {
        let person = build(Person()) {
            $0.name = "Luke Skywalker"
            $0.age = 17
        }

        XCTAssert(person.name! == "Luke Skywalker")
        XCTAssert(person.age! == 17)
    }
}
