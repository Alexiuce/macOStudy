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
    
    var devicesDictionary = [String:[Device]]()
    
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
        devicesDictionary.forEach { (key,value) in
          
            let titilItem = NSMenuItem(title: key, action: nil, keyEquivalent: "")
            mainMenu.addItem(titilItem)
            value.forEach{
                let deviceItem = NSMenuItem(title: $0.name, action: nil, keyEquivalent: "")
                deviceItem.image = NSImage(named: NSImage.Name("iPhone"))
                mainMenu.addItem(deviceItem)
                let subMenu = NSMenu()
                $0.appArray.forEach({ (app) in
                    let appItem = SAppMenuItem(title: app.name, action: nil, keyEquivalent: "")
                    appItem.image = app.icon
                    appItem.representedObject = app
                    subMenu.addItem(appItem)
                })
                deviceItem.submenu = subMenu
            }
        }
         mainMenu.addItem(NSMenuItem.separator())
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
        preferenceController.window?.orderFrontRegardless()
        preferenceController.showWindow(self)
    }
    @objc fileprivate func exitItem(){
        NSApp.terminate(self)
    }
    
}
//MARK: app item event response
extension MenuManager{
    
    @objc fileprivate func clickAppItem(_ item: NSMenuItem){
        guard let app = item.representedObject as? SimuApplication else { return  }
        guard let url = app.documentPath else {return}
        NSWorkspace.shared.open(url)
    }
    
}
