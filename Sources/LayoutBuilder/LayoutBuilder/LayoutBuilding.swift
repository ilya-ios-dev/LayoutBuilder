//
//  LayoutBuilding.swift
//  
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit

public protocol SubviewContaining { }

extension UIView: SubviewContaining { }

public extension SubviewContaining where Self: UIView {
    
    /// Add a child subview and directly activate the given constraints.
    func addSubview<View: UIView>(
        _ view: View,
        @LayoutBuilder constraints: (Self, View) -> [NSLayoutConstraint]
    ) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(self, view))
    }
}

public extension NSLayoutConstraint {
    /// Activate the layouts defined in the result builder parameter `constraints`.
    static func activate(@LayoutBuilder constraints: () -> [NSLayoutConstraint]) {
        activate(constraints())
    }
}
