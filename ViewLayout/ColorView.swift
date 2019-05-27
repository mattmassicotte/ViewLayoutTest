//
//  ColorView.swift
//  ViewLayout
//
//  Created by Matt Massicotte on 2019-05-27.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Cocoa

class ColorView: NSView {
    var color: NSColor {
        didSet {
            needsDisplay = true
        }
    }

    init(frame frameRect: NSRect, color: NSColor) {
        self.color = color

        super.init(frame: frameRect)
    }

    convenience init(color: NSColor) {
        self.init(frame: NSRect.zero, color: color)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ dirtyRect: NSRect) {
        color.set()
        NSBezierPath.fill(dirtyRect)
    }
}

