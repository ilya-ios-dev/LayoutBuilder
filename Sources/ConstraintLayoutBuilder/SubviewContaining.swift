//
//  SubviewContaining.swift
//  
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit

public protocol SubviewContaining { }

extension UIView: SubviewContaining { }

public extension SubviewContaining where Self: UIView {
    
    func addSubview<View: UIView>(
        _ child: View,
        @ConstraintLayoutBuilder constraints: (Self, View) -> [NSLayoutConstraint]
    ) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(self, child))
    }
    
    func insertSubview<View: UIView>(
        _ child: View, belowSubview siblingSubview: UIView,
        @ConstraintLayoutBuilder constraints: (Self, View) -> [NSLayoutConstraint]
    ) {
        insertSubview(child, belowSubview: siblingSubview)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(self, child))
    }
    
    func insertSubview<View: UIView>(
        _ child: View, at index: Int,
        @ConstraintLayoutBuilder constraints: (Self, View) -> [NSLayoutConstraint]
    ) {
        insertSubview(child, at: index)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(self, child))
    }
}

public extension SubviewContaining where Self: UIStackView {
    func addArrangedSubview<View: UIView>(
        _ view: View,
        @ConstraintLayoutBuilder constraints: (Self, View) -> [NSLayoutConstraint]
    ) {
        addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(self, view))
    }
}

public extension NSLayoutConstraint {
    static func activate(@ConstraintLayoutBuilder constraints: () -> [NSLayoutConstraint]) {
        activate(constraints())
    }
}
