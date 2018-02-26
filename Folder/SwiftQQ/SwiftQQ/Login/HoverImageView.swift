//
//  HoverImageView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class HoverImageView: NSImageView {
    
    override func awakeFromNib() {
        // 1 添加监听鼠标移入移出
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
    }
    // 2 .实现鼠标移入移出的方法
    override func mouseExited(with event: NSEvent) {
         image = NSImage(named: NSImage.Name(rawValue: "head-normal"))
    }
    
    override func mouseEntered(with event: NSEvent) {
        image = NSImage(named: NSImage.Name(rawValue: "circle-big"))
    }
}
