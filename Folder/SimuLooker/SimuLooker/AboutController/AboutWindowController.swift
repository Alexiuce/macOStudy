//
//  AboutWindowController.swift
//  SimuLooker
//
//  Created by Alexcai on 2018/9/2.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class AboutWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        window?.standardWindowButton(.zoomButton)?.isHidden = true
        window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
       
    }

}
