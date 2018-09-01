//
//  PreferenceWindowController.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/3/1.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class PreferenceWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        window?.standardWindowButton(.zoomButton)?.isHidden = true
        
        window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
    }

}
