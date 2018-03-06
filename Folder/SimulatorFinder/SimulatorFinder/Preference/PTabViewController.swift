//
//  PTabViewController.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/3.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class PTabViewController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, didSelect: tabViewItem)
        
        guard let window = view.window else { return  }
        guard let tabItemView = tabViewItem?.view else { return  }
        
        
        
        // 原来的frame(改变之前的)
        let oldFrame = window.frame
    
        // 计算改变之后的新的Frame
          // 1. 获取显示view的size
        let showViewSize = tabItemView.fittingSize
          // 2. 根据显示view的size计算window的frame
          // 3. 计算新的y坐标
        var newFrame =  window.frameRect(forContentRect: NSMakeRect(oldFrame.origin.x, oldFrame.origin.y, showViewSize.width, showViewSize.height))
    
        let newY =  oldFrame.origin.y -  (newFrame.size.height - oldFrame.size.height)
        
        newFrame.origin = NSMakePoint(oldFrame.origin.x, newY)
        
        // 设置window frame 变更动画
        
        NSAnimationContext.runAnimationGroup({ (context) in
            window.animator().setFrame(newFrame, display: window.isVisible)
        }, completionHandler: nil)
        
        
        
        
    }
    
}
