//
//  HoverButton.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class HoverButton: NSButton {
    
    var isHoverNormal = false    // 鼠标移入时的显示状态
    var normalImage : NSImage?
    var hoverImaeg : NSImage?
    override func awakeFromNib() {
       
    }
   
    func addHover(normalImageName:String,hoverImageName:String)  {
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
        normalImage = NSImage(named: NSImage.Name(normalImageName))
        hoverImaeg = NSImage(named: NSImage.Name(hoverImageName))
    }
    
    
    override func mouseEntered(with event: NSEvent) {
        image = hoverImaeg
    }
    
    override func mouseExited(with event: NSEvent) {
        if isHoverNormal {
           image = NSImage(named: NSImage.Name("icon-enter-normal"))
        }else{
            image = normalImage            
        }
    }
    
    
    // 更新normal状态下的图片
    func updateNormalImageName(name: String)  {
        normalImage = NSImage(named: NSImage.Name(name))
    }
    
}
