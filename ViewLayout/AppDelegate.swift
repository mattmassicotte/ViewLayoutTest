//
//  AppDelegate.swift
//  ViewLayout
//
//  Created by Matt Massicotte on 2019-05-27.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = LayoutAnimationViewController()

        window.setContentSize(NSSize(width: 200.0, height: 200.0))
    }
}

