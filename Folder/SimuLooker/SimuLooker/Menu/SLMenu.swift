//
//  SLMenu.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/26.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class SLMenu: NSMenu {

    /** 单利 */
    static let shareMenu = SLMenu()
    
    /* 懒加载属性 */
    lazy var statusItem : NSStatusItem = {
        let item = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
        let image = NSImage(named: NSImage.Name("StatusItemIcon"))
        image?.isTemplate = true
        item.image = image
        return item
    }()
    
    override init(title: String) {
        super.init(title: "")
        loadDevice()
        setupUI()
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: init UI
extension SLMenu{
    /* 初始化UI */
    fileprivate func setupUI(){
        
        let mainMenu = NSMenu(title: "main")
        
        // 1. 添加item
        let aboutItem = NSMenuItem(title: "About SimuLooker", action: #selector(SLMenu.aboutItem), keyEquivalent: "")
        aboutItem.target = self
        mainMenu.addItem(aboutItem)
      
        mainMenu.addItem(NSMenuItem.separator())
        
        let preferenceItem = NSMenuItem(title: "Preferences", action: #selector(SLMenu.preferenceItem), keyEquivalent: ",")
        preferenceItem.target = self
        mainMenu.addItem(preferenceItem)
       
        
        mainMenu.addItem(NSMenuItem.separator())
        
        let exitItem = NSMenuItem(title: "Exit SimuLooker", action: #selector(SLMenu.exitItem), keyEquivalent: "q")
        exitItem.target = self
        mainMenu.addItem(exitItem)
        
        self.statusItem.menu = mainMenu
    }
    /** 加载设备 */
   fileprivate func loadDevice()  {

        ShellTask.execCmd(cmd: "/usr/bin/xcrun", arguments: ["simctl", "list", "-j", "devices"]){ result in
           
            print(result)
        }
    
    }
    
}
// MARK: event response
extension SLMenu{
    @objc fileprivate  func aboutItem(){
        print("click about item")
    }
    
    @objc fileprivate func preferenceItem(){
        print("click preferences")
    }
    @objc fileprivate func exitItem(){
        print("exit simulooker")
    }
    
}

