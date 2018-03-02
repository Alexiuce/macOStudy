//
//  SAppMenuItem.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/3/1.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class SAppMenuItem: NSMenuItem {
    
    override init(title string: String, action selector: Selector?, keyEquivalent charCode: String) {
        super.init(title: string, action: selector, keyEquivalent: charCode)
        setupUI()
        
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SAppMenuItem{
    fileprivate func setupUI(){
        let appView = SAppItemView(frame: NSMakeRect(0, 0, 275, 70))
        self.view = appView
    }
}
