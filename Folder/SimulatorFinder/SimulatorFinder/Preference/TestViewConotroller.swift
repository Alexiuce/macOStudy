//
//  TestViewConotroller.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/3.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class TestViewConotroller: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        preferredContentSize = view.frame.size
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
}
