//
//  ScopeFunc.swift
//  IOS Example
//
//  Created by isEmpty on 12.01.2022.
//

import Foundation

public protocol ScopeFunc {}

public extension ScopeFunc {

    @discardableResult
    @inline(__always)
    func apply(configure: (inout Self) -> Void) -> Self {
        var copy = self
        configure(&copy)
        return copy
    }
}

extension NSObject: ScopeFunc {}
