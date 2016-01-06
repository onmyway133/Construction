//
//  Configurable.swift
//  Pods
//
//  Created by Khoa Pham on 12/30/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

// MARK: Configurable
public protocol Configurable { }

public extension Configurable {
    func configure(@noescape block: Self -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Configurable { }

// MARK: Free Function
public func build<T>(value: T, @noescape block: T -> Void) -> T {
    block(value)
    return value
}