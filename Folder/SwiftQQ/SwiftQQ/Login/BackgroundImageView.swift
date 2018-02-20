//
//  BackgroundImageView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class BackgroundImageView: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    // 1 . 重写方法,支持鼠标移动窗口
    override var mouseDownCanMoveWindow: Bool{
        return true
    }
    
}
