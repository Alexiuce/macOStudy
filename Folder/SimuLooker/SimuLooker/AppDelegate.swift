//
//  AppDelegate.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/26.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let itemMenu = SLMenu.shareMenu
       
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

