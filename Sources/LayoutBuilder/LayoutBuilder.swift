//
//  LayoutBuilder.swift
//  
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit

@resultBuilder
public struct LayoutBuilder {
    public static func buildBlock(_ components: LayoutGroup...) -> [NSLayoutConstraint] {
        return components.flatMap { $0.constraints }
    }
    
    public static func buildOptional(_ component: [LayoutGroup]?) -> [NSLayoutConstraint] {
        return component?.flatMap { $0.constraints } ?? []
    }
    
    public static func buildEither(first component: [LayoutGroup]) -> [NSLayoutConstraint] {
        return component.flatMap { $0.constraints }
    }
    
    public static func buildEither(second component: [LayoutGroup]) -> [NSLayoutConstraint] {
        return component.flatMap { $0.constraints }
    }
}
