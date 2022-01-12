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

public extension NSLayoutConstraint: LayoutGroup {
    var constraints: [NSLayoutConstraint] { [self] }
}

public extension Array: LayoutGroup where Element == NSLayoutConstraint {
    var constraints: [NSLayoutConstraint] { self }
}
