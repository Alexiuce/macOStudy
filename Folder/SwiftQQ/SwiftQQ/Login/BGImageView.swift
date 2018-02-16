//
//  BGImageView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//

import Cocoa

class BGImageView: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override var mouseDownCanMoveWindow: Bool{
        return true
    }
    
    
}
