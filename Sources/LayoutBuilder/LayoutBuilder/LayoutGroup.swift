//
//  LayoutGroup.swift
//  
//
//  Created by isEmpty on 12.01.2022.
//

import Foundation
import UIKit

public protocol LayoutGroup {
    var constraints: [NSLayoutConstraint] { get }
}

extension NSLayoutConstraint: LayoutGroup {
    public var constraints: [NSLayoutConstraint] { [self] }
}

extension Array: LayoutGroup where Element == NSLayoutConstraint {
    public var constraints: [NSLayoutConstraint] { self }
}
