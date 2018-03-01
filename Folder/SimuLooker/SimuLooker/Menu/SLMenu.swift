//
//  SLMenu.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/26.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class SLMenu: NSMenu {

    
    
    
}

// MARK: init UI
//extension SLMenu{
//
//   
//    
//    /* 添加device item */
//    fileprivate func addDeviceItem(){
//        guard let  mainMenu = statusItem.menu else { return  }
//        var index = 0
//        
//        SimuDeviceManager.simuDeviceOSKey.forEach { (key) in
//            if key.contains("iOS"){
//                let os_devices = SimuDeviceManager.devices(key)
//            
//                if os_devices.count > 0{
//                    let titleItem = NSMenuItem(title: key, action: nil, keyEquivalent: "")
//                    titleItem.isEnabled = false
//                    mainMenu.insertItem(titleItem, at: index)
//                    index += 1
//                    os_devices.forEach{
//                        
//                        let deviceItem = NSMenuItem(title: $0.name, action: nil, keyEquivalent: "")
//                        if $0.name.contains("iPhone") {
//                            deviceItem.image = NSImage(named: NSImage.Name(rawValue: "iPhone"))
//                            let subMenu = NSMenu()
//                            
//                            $0.appArray.forEach({ (app) in
//                                let appItem = NSMenuItem(title: app.name, action: #selector(SLMenu.clickAppItem(_:)), keyEquivalent: "")
//                                 appItem.image = app.icon
//                                 appItem.representedObject = app
//                                 appItem.target = self
//                                subMenu.addItem(appItem)
//                            })
//                            deviceItem.submenu = subMenu
//                        }
//
//                        mainMenu.insertItem(deviceItem, at: index)
//                        index += 1
//                    }
//                }
//            }
//        }
//    }
//}




