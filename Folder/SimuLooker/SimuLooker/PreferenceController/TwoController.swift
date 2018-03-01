//
//  TwoController.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/28.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class TwoController: NSViewController {

    @IBOutlet var backgroundView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.purple.cgColor
        self.preferredContentSize = view.frame.size
        // Do view setup here.
    }
    
}
