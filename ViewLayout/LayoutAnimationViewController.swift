//
//  LayoutAnimationViewController.swift
//  ViewLayout
//
//  Created by Matt Massicotte on 2019-05-27.
//  Copyright © 2019 My Organization. All rights reserved.
//

import Cocoa

class LayoutAnimationViewController: NSViewController {
    let containerView: NSView
    let view1: ColorView
    let view2: ColorView
    let view3: ColorView
    let constraintA: NSLayoutConstraint

    init() {
        self.containerView = NSView()
//        self.containerView.wantsLayer = true

        self.view1 = ColorView(color: NSColor.red)
        self.view2 = ColorView(color: NSColor.blue)
        self.view3 = ColorView(color: NSColor.green)

        self.constraintA = view1.trailingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 0.0)
        self.constraintA.priority = .defaultLow

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = containerView

        view.addSubview(view3)
        view.addSubview(view2, positioned: .below, relativeTo: view3)
        view.addSubview(view1)
        view.subviewsUseAutoLayout = true

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 200.0),
            containerView.heightAnchor.constraint(equalToConstant: 200.0),

            view1.topAnchor.constraint(equalTo: view.topAnchor),
            view1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor),
            view1.widthAnchor.constraint(equalTo: view2.widthAnchor),
            constraintA,

            view2.topAnchor.constraint(equalTo: view.topAnchor),
            view2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view2.trailingAnchor.constraint(equalTo: view3.trailingAnchor, priority: .defaultLow),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor),

            view3.topAnchor.constraint(equalTo: view.topAnchor),
            view3.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, priority: .justAboveWindowSizeStayPut),
            view3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view3.widthAnchor.constraint(equalToConstant: 100.0),
        ])
    }

    func runAnimation() {
        view.layoutSubtreeIfNeeded()

        NSAnimationContext.runAnimationGroup({ (context) in
            context.allowsImplicitAnimation = true
            context.duration = 1.0

            self.constraintA.toggleDefaultPriority()

            self.view.layoutSubtreeIfNeeded()
        }) {
            Swift.print("animation complete")
        }
    }
}

extension LayoutAnimationViewController {
    @IBAction func runTest1(_ sender: Any?) {
        self.runAnimation()
    }
}
