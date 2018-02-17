//
//  HoverImageView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa

class HoverImageView: NSImageView {

    lazy var normalImage: NSImage = {
        let img = NSImage(named: NSImage.Name(rawValue: "head-normal"))
        return img!
    }()
    
    lazy var hoverImage : NSImage = {
        let img = NSImage(named: NSImage.Name(rawValue: "circle-big"))
        return img!
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer?.cornerRadius = bounds.size.width * 0.5
        
        // 1. 添加鼠标监听
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeAlways,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
    }
    
    override func mouseEntered(with event: NSEvent) {
        image = hoverImage
    }
    
    override func mouseExited(with event: NSEvent) {
        image = normalImage
    }
}
