//
//  PreTableViewController.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/28.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class PreTableViewController: NSTabViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, didSelect: tabViewItem)
        
        guard let itemView = tabViewItem?.view,
              let window = view.window
              else {return}

        
        let oldFrame = window.frame
        
        let newViewSize = itemView.fittingSize
        
        var newFrame = window.frameRect(forContentRect: NSMakeRect(oldFrame.origin.x, oldFrame.origin.y, newViewSize.width, newViewSize.height))
        
        let newY = oldFrame.origin.y - ( newFrame.size.height - oldFrame.size.height)
        newFrame.origin = NSMakePoint(oldFrame.origin.x, newY)
    
        NSAnimationContext.runAnimationGroup({ (context) in
            window.animator().setFrame(newFrame, display: window.isVisible)
        }, completionHandler: nil)
        
    }
    
}
