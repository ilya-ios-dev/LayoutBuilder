//
//  UIView+Constraint.swift
//  
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit

public extension UIView {
    typealias Constraint = (_ parent: UIView) -> NSLayoutConstraint
    
    func addConstraint(to view: UIView, _ constraint: Constraint) -> NSLayoutConstraint {
        return constraint(self)
    }
    
    func addSubview<View: UIView>(_ child: View, @KeyPathLayoutBuilder constraints: (View) -> [Constraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(child).map { $0(self) })
    }
    
    func insertSubview<View: UIView>(_ child: View, belowSubview siblingSubview: UIView, @KeyPathLayoutBuilder constraints: (View) -> [Constraint]) {
        insertSubview(child, belowSubview: siblingSubview)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(child).map { $0(self) })
    }
    
    func insertSubview<T: UIView>(_ child: T, at index: Int, @KeyPathLayoutBuilder constraints: (T) -> [Constraint]) {
        insertSubview(child, at: index)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(child).map { $0(self) })
    }
}

public extension UIStackView {
    func addArrangedSubview<View: UIView>(_ view: View, @KeyPathLayoutBuilder constraints: (View) -> [Constraint]) {
        addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints(view).map { $0(self) })
    }
}

public extension UIView {
    // MARK: - Anchors -
    // MARK: Equal
    func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                             _ to: KeyPath<UIView, Anchor>,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { parent in
            self[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return equal(keyPath, keyPath, constant: constant, priority: priority)
    }
    
    func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                             to view: UIView,
                             _ to: KeyPath<UIView, Anchor>,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { _ in
            self[keyPath: keyPath].constraint(equalTo: view[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                             to view: UIView,
                             constant: CGFloat = 0,
                             priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return equal(keyPath, to: view, keyPath, constant: constant, priority: priority)
    }
    
    // MARK: Greather Than
    func greatherThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                    _ to: KeyPath<UIView, Anchor>,
                                    constant: CGFloat = 0,
                                    priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { parent in
            self[keyPath: keyPath].constraint(greaterThanOrEqualTo: parent[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func greatherThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                    constant: CGFloat = 0,
                                    priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return greatherThan(keyPath, keyPath, constant: constant, priority: priority)
    }
    
    func greatherThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                    to view: UIView,
                                    _ to: KeyPath<UIView, Anchor>,
                                    constant: CGFloat = 0,
                                    priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { _ in
            self[keyPath: keyPath].constraint(greaterThanOrEqualTo: view[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func greatherThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                    to view: UIView,
                                    constant: CGFloat = 0,
                                    priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return greatherThan(keyPath, to: view, keyPath, constant: constant, priority: priority)
    }
    
    // MARK: Less Than
    func lessThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                _ to: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { parent in
            self[keyPath: keyPath].constraint(lessThanOrEqualTo: parent[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func lessThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return lessThan(keyPath, keyPath, constant: constant, priority: priority)
    }
    
    func lessThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                to view: UIView,
                                _ to: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return { _ in
            self[keyPath: keyPath].constraint(lessThanOrEqualTo: view[keyPath: to], constant: constant)
                .with(priority: priority)
        }
    }
    
    func lessThan<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                to view: UIView,
                                constant: CGFloat = 0,
                                priority: UILayoutPriority = .required) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
        return lessThan(keyPath, to: view, keyPath, constant: constant, priority: priority)
    }
    
    // MARK: - Dimensions -
    func aspectRatio(multiplier: CGFloat = 1, priority: UILayoutPriority = .required) -> Constraint {
        return { _ in
            self[keyPath: \.widthAnchor].constraint(equalTo: self[keyPath: \.heightAnchor], multiplier: multiplier)
                .with(priority: priority)
        }
    }
    
    func equal<Dimension>(_ keyPath: KeyPath<UIView, Dimension>,
                          _ to: KeyPath<UIView, Dimension>,
                          multiplier: CGFloat = 1,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = .required) -> Constraint where Dimension: NSLayoutDimension {
        return { parent in
            self[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], multiplier: multiplier, constant: constant)
                .with(priority: priority)
        }
    }
    
    func equal<Dimension>(_ keyPath: KeyPath<UIView, Dimension>,
                          multiplier: CGFloat = 1,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = .required) -> Constraint where Dimension: NSLayoutDimension {
        return equal(keyPath, keyPath, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    func equal<Dimension>(_ keyPath: KeyPath<UIView, Dimension>,
                          to view: UIView,
                          _ to: KeyPath<UIView, Dimension>,
                          multiplier: CGFloat = 1,
                          constant: CGFloat = 0,
                          priority: UILayoutPriority = .required) -> Constraint where Dimension: NSLayoutDimension {
        return { _ in
            self[keyPath: keyPath].constraint(equalTo: view[keyPath: to], multiplier: multiplier, constant: constant)
                .with(priority: priority)
        }
    }
    
    func equal<Dimension>( _ keyPath: KeyPath<UIView, Dimension>,
                           to view: UIView,
                           multiplier: CGFloat = 1,
                           constant: CGFloat = 0,
                           priority: UILayoutPriority = .required) -> Constraint where Dimension: NSLayoutDimension {
        return equal(keyPath, to: view, keyPath, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    func equalToConstant<Dimension>(_ keyPath: KeyPath<UIView, Dimension>,
                                    constant: CGFloat = 0,
                                    priority: UILayoutPriority = .required) -> Constraint where Dimension: NSLayoutDimension {
        return { _ in
            self[keyPath: keyPath].constraint(equalToConstant: constant)
                .with(priority: priority)
        }
    }
}

public extension NSLayoutConstraint {
    func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
