//
//  HomeWindowController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa
import SnapKit

class HomeWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.isMovableByWindowBackground = true
      
        updateWindowTitleBar()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    fileprivate func updateWindowTitleBar(){
        
        let themeView = window?.contentView?.superview
        let titleView = themeView?.subviews.last
        titleView?.autoresizesSubviews = true
        titleView!.snp.makeConstraints { (make) in
            make.top.equalTo(23)
            make.left.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        
    }
}

extension HomeWindowController: NSWindowDelegate{
    func windowDidResize(_ notification: Notification) {
       updateWindowTitleBar()
    }
    
   
   
}
