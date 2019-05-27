//
//  NSLayoutConstraint+Priority.swift
//  ViewLayout
//
//  Created by Matt Massicotte on 2019-05-27.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Cocoa

extension NSLayoutConstraint {
    func toggleDefaultPriority() {
        switch priority {
        case .defaultHigh:
            priority = .defaultLow
        case .defaultLow:
            priority = .defaultHigh
        default:
            fatalError()
        }
    }
}

extension NSLayoutConstraint.Priority {
    public static let justAboveWindowSizeStayPut = NSLayoutConstraint.Priority(NSLayoutConstraint.Priority.windowSizeStayPut.rawValue + 1.0)
    public static let justBelowWindowSizeStayPut = NSLayoutConstraint.Priority(NSLayoutConstraint.Priority.windowSizeStayPut.rawValue - 1.0)

}

extension NSLayoutAnchor {
    @objc public func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, priority p: NSLayoutConstraint.Priority) -> NSLayoutConstraint {
        let c = constraint(equalTo: anchor)

        c.priority = p

        return c
    }
}
