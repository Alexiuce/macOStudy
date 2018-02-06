//
//  LCImageView.swift
//  LCImageView
//
//  Created by caijinzhu on 2018/2/6.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class LCImageView: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        layer?.cornerRadius = bounds.height * 0.5
        layer?.masksToBounds = false
        setBorderColorAndWidth(color: NSColor.lightGray, width: 1)
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)

    }
    
    override func mouseDown(with event: NSEvent) {
        startCircleAnimation()
    }
    override func mouseEntered(with event: NSEvent) {
        setBorderColorAndWidth(color: NSColor.yellow, width: 3)
        
    }
    override func mouseExited(with event: NSEvent) {
        setBorderColorAndWidth(color: NSColor.lightGray, width: 1)
    }
    
    fileprivate func setBorderColorAndWidth(color:NSColor,width:CGFloat){
        layer?.borderColor = color.cgColor;
        layer?.borderWidth = width;
    }
    
    func startCircleAnimation(){
        let circleLayer = CALayer()
        circleLayer.frame = NSInsetRect(bounds, 5, 5)
        circleLayer.borderWidth = 1
        circleLayer.borderColor = NSColor.red.cgColor
        layer?.addSublayer(circleLayer)
        
        let circleAnimation = CABasicAnimation()
        circleAnimation.duration = 2
        circleAnimation.repeatCount = MAXFLOAT
        circleAnimation.fromValue = 0
        circleAnimation.toValue = Double.pi
        
        circleLayer.add(circleAnimation, forKey: "transform.rotation.z")
        
    
    }
    
}
