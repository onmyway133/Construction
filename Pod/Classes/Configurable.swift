//
//  Configurable.swift
//  Pods
//
//  Created by Khoa Pham on 12/30/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import Foundation

public protocol Configurable { }

public extension Configurable {
    func configure(@noescape block: Self -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Configurable { }

