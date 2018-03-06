//
//  GeneralViewController.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/3.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class GeneralViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.layer?.backgroundColor = NSColor.orange.cgColor
        
        preferredContentSize = view.frame.size
    }
    
}
