//
//  MenuManager.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/1.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class MenuManager: NSObject {

    
    lazy var statusItem : NSStatusItem = {
        let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        // 2. 设置图片
        let image = NSImage(named: NSImage.Name(rawValue: "statusIcon"))
        // 设置图片适应状态栏主题
        image?.isTemplate = true
        
        statusBarItem.image = image
        return statusBarItem
    }()
    
    /* 从Storyboard或者xib中加载时,调用awakeFromNib */
    override func awakeFromNib() {
        super.awakeFromNib()
         self.createStatusMenu()
    }
    
}


extension MenuManager{
    fileprivate func createStatusMenu(){
        // 添加主菜单
        let mainMenu = NSMenu()
        
        // 1. 获取系统状态栏的StatusItem
     
        let devices = DeviceManager.loadDevice()
        devices.forEach { (key,value) in
            if value.count > 0 {
                // 添加系统标题子项
                let osTitleItem = NSMenuItem(title: key, action: nil, keyEquivalent: "")
                mainMenu.addItem(osTitleItem)                
            }
            // 添加设备项
            value.forEach{
                let deviceItem = NSMenuItem(title: $0.name, action: nil, keyEquivalent: "")
                deviceItem.image = NSImage(named: NSImage.Name(rawValue: "iphone-narmal"))
                if $0.state == "Booted"{
                    deviceItem.image = NSImage(named: NSImage.Name(rawValue: "iphone"))
                }
                mainMenu.addItem(deviceItem)
                // 创建应用子菜单
                let subAppMenu = NSMenu()
                $0.installApps.forEach({ (app) in
                    let appItem = AppMenuItem(title: app.name, action: #selector(MenuManager.openAppLocation(_:)), keyEquivalent: "")
                    appItem.target = self
                    appItem.representedObject = app
                    appItem.image = app.icon
                    
                    subAppMenu.addItem(appItem)
                    subAppMenu.addItem(NSMenuItem.separator())
                })
                
                // 给设备item 添加应用子菜单
                deviceItem.submenu = subAppMenu
            }
        }
        mainMenu.addItem(NSMenuItem.separator())
        
        // 添加关于子选项
        let aboutItem = NSMenuItem(title: "About SimulatorFinder", action: #selector(MenuManager.showAbout), keyEquivalent: "")
        aboutItem.target = self
        mainMenu.addItem(aboutItem)
        // 添加Preference 子项
        let preferenceItem = NSMenuItem(title: "Preference...", action: #selector(MenuManager.showPreference), keyEquivalent: "")
        mainMenu.addItem(preferenceItem)
        preferenceItem.target = self
        // 添加分隔
        mainMenu.addItem(NSMenuItem.separator())
        
        // 添加退出项
        let exitItem = NSMenuItem(title: "Exit SimulatorFinder", action: #selector(MenuManager.exitApp), keyEquivalent: "")
        mainMenu.addItem(exitItem)
        exitItem.target = self
        statusItem.menu = mainMenu
        
    }
    @objc func click()  {
        print("click statusItem ....")
    }
}

// MARK: event response
extension MenuManager{
   @objc fileprivate func showAbout(){
        print("show about")
    }
   @objc fileprivate func showPreference(){
        print("show preference")
        guard let preferenceWindowController = NSStoryboard(name: NSStoryboard.Name.init(rawValue: "preference"), bundle: nil).instantiateInitialController() as? NSWindowController else { return  }
    
        // 设置窗口显示再最前面
        preferenceWindowController.window?.orderFrontRegardless()
    
        preferenceWindowController.showWindow(self)
    
    }
   @objc fileprivate func exitApp(){
        print("exit. app")
        NSApp.terminate(self)
    }
    
    @objc fileprivate func openAppLocation(_ appItem: NSMenuItem){
       
        guard let appInfo = appItem.representedObject as? App else { return  }
      
        guard let appLocationUrl = appInfo.appPath else { return  }
        // 打开指定url路径
        NSWorkspace.shared.open(appLocationUrl)
    }
}











