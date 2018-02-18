//
//  HomeWindowController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa

class HomeWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.isMovableByWindowBackground = true
       
        let themeView = window?.standardWindowButton(NSWindow.ButtonType.closeButton)?.superview?.superview
        
        themeView?.frame.origin.y -= (34 - (themeView?.frame.height)! * 0.5)
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
       window?.delegate = self
    }
    
   
}

extension HomeWindowController: NSWindowDelegate{
   
   
}
