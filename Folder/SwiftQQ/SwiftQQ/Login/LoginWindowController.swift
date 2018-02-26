//
//  LoginWindowController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        // 1. 设置点击内容视图时可移动窗口
        window?.isMovableByWindowBackground = true
        
        // 2 .设置窗口背景色为透明
        window?.backgroundColor = NSColor.clear
    }

}
