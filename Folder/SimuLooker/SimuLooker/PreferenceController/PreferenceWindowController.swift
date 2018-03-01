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
    
        window?.standardWindowButton(NSWindow.ButtonType.zoomButton)?.isHidden = true
        window?.standardWindowButton(NSWindow.ButtonType.miniaturizeButton)?.isHidden = true
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
