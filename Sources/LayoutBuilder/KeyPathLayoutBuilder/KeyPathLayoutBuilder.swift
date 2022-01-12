//
//  KeyPathLayoutBuilder.swift
//
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit

@resultBuilder
public struct KeyPathLayoutBuilder {
    public static func buildBlock(_ components: UIView.Constraint...) -> [UIView.Constraint] {
        return components
    }
    
    public static func buildOptional(_ component: [UIView.Constraint]?) -> [UIView.Constraint] {
        return component ?? []
    }
    
    public static func buildEither(first component: [UIView.Constraint]) -> [UIView.Constraint] {
        return component
    }
    
    public static func buildEither(second component: [UIView.Constraint]) -> [UIView.Constraint] {
        return component
    }
}
