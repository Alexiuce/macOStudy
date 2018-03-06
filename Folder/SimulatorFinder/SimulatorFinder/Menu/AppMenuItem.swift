//
//  AppMenuItem.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/3.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class AppMenuItem: NSMenuItem {


    override var representedObject: Any?{
        didSet{
            guard let obj = representedObject as? App else { return  }
            guard let appView = view as? AppItemView else { return  }
            appView.appID.stringValue = obj.bid
            appView.appName.stringValue = obj.name
            appView.appIcon.image = obj.icon
            appView.appData = obj
        }
    }
    
    override init(title string: String, action selector: Selector?, keyEquivalent charCode: String) {
        super.init(title: string, action: selector, keyEquivalent: charCode)
        setupUI()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    
    
    fileprivate func setupUI(){
        let appView = AppItemView(frame: NSMakeRect(0, 0, 289, 83))
        appView.appName.stringValue = title
        view = appView
        
    }
}
