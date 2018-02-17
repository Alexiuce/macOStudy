//
//  HoverButton.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa

class HoverButton: NSButton {
    var isHoverNormal = false
    override func awakeFromNib() {
        super.awakeFromNib()

        let trackArea = NSTrackingArea(rect: bounds, options:[.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
    }
    override func mouseEntered(with event: NSEvent) {
        image = NSImage(named: NSImage.Name("icon-enter-hover"))
    }
    override func mouseExited(with event: NSEvent) {
        let imgName = isHoverNormal ? NSImage.Name("icon-enter-normal") : NSImage.Name("icon-enter-undo")
        image = NSImage(named: imgName)
    }
    
    
}
