//
//  NSView+AutoLayout.swift
//  ViewLayout
//
//  Created by Matt Massicotte on 2019-05-27.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Cocoa

extension NSView {
    public var useAutoLayout: Bool {
        get {
            return translatesAutoresizingMaskIntoConstraints
        }
        set {
            translatesAutoresizingMaskIntoConstraints = !newValue
        }
    }

    public var subviewsUseAutoLayout: Bool {
        get {
            return subviews.reduce(into: true, { (result, subview) in
                result = result && subview.useAutoLayout
            })
        }
        set {
            subviews.forEach { $0.useAutoLayout = newValue }
        }
    }
}
