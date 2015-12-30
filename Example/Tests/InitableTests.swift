//
//  InitableTests.swift
//  Configurable
//
//  Created by Khoa Pham on 12/30/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import XCTest
import UIKit
import Configurable

extension UILabel: Initable {}

final class Robot {
    var name: String?
    var cute = false
}

extension Robot: Initable { }

class InitableTests: XCTestCase {
    func testClassWithExistingInit() {
        let label = UILabel {
            $0.text = "Fantageek"
        }

        XCTAssert(label.text == "Fantageek")
    }

    func testCustom() {
        let robot = Robot {
            $0.name = "R2-D2"
            $0.cute = true
        }

        XCTAssert(robot.name == "R2-D2")
        XCTAssert(robot.cute)
    }
}