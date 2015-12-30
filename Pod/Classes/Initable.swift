//
//  Initable.swift
//  Pods
//
//  Created by Khoa Pham on 12/30/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

public protocol Initable {
    // To make init in protocol extension work
    init()
}

public extension Initable {
    public init(@noescape block: Self -> Void) {
        self.init()
        block(self)
    }
}