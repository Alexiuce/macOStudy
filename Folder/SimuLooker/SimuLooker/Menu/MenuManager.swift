//
//  MenuManager.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/3/1.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

import SwiftyJSON

class MenuManager: NSObject {
    
    var devicesDictionary = [String: JSON]()
    
    lazy var preferenceController : NSWindowController = {
        let vc = NSStoryboard(name: NSStoryboard.Name.init(rawValue: "preference"), bundle: nil).instantiateInitialController() as! PreferenceWindowController
        return vc
    }()
 
    lazy var statusItem: NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
        let image = NSImage(named: NSImage.Name("StatusItemIcon"))
        image?.isTemplate = true
        item.image = image
        return item
    }()
    
    override func awakeFromNib() {
        // 加载devices 数据
       devicesDictionary = SimuDeviceManager.loadSimuDevice()
        // 创建device menu
        createDeviceMenu()
    }
    
}



extension MenuManager{
    fileprivate func  createDeviceMenu(){
        let mainMenu = NSMenu(title: "main")
        
        var itemIndex = 0
        devicesDictionary.forEach { (key,value) in
            if !key.contains("iOS") {return}
            let titilItem = NSMenuItem(title: key, action: nil, keyEquivalent: "")
            mainMenu.insertItem(titilItem, at: itemIndex)
            itemIndex += 1
            value.arrayValue.forEach{
                let subItem = NSMenuItem(title: $0["name"].stringValue, action: nil, keyEquivalent: "")
                mainMenu.addItem(subItem)
                itemIndex += 1
            }
            
        }
        
        
        // 1. 添加item
        let aboutItem = NSMenuItem(title: "About SimuLooker", action: #selector(self.aboutItem), keyEquivalent: "")
        aboutItem.target = self
        mainMenu.addItem(aboutItem)
        
        let preferenceItem = NSMenuItem(title: "Preferences", action: #selector(self.preferenceItem), keyEquivalent: ",")
        preferenceItem.target = self
        mainMenu.addItem(preferenceItem)
        mainMenu.addItem(NSMenuItem.separator())
        
        let exitItem = NSMenuItem(title: "Exit SimuLooker", action: #selector(self.exitItem), keyEquivalent: "q")
        exitItem.target = self
        mainMenu.addItem(exitItem)
        
        statusItem.menu = mainMenu
    }
}

// MARK: event response
extension MenuManager{
    @objc fileprivate  func aboutItem(){
        print("click about item")
    }
    
    @objc fileprivate func preferenceItem(){
        print("click preferences")
        
        preferenceController.showWindow(self)
        
        
        
    }
    @objc fileprivate func exitItem(){
        NSApp.terminate(self)
    }
    
}
//MARK: app item event response
extension SLMenu{
    
    @objc fileprivate func clickAppItem(_ item: NSMenuItem){
        guard let app = item.representedObject as? SimuApplication else { return  }
        guard let url = app.documentPath else {return}
        NSWorkspace.shared.open(url)
    }
    
}
