//
//  HomeWindowController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa

class HomeWindowController: NSWindowController {

    lazy var themeView: NSView = {
        let view = self.window?.standardWindowButton(NSWindow.ButtonType.closeButton)?.superview
        return view!
    }()

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.isMovableByWindowBackground = true
      
       
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    fileprivate func updateWindowTitleBar(){
       
        
    }
}

extension HomeWindowController: NSWindowDelegate{
    func windowDidResize(_ notification: Notification) {
       
    }
    
   
   
}
