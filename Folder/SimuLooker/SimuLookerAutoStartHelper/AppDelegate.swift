//
//  AppDelegate.swift
//  SimuLookerAutoStartHelper
//
//  Created by Alexcai on 2018/9/3.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        var compoents = (Bundle.main.bundlePath as NSString).pathComponents as NSArray
        compoents = compoents.subarray(with: NSMakeRange(0, compoents.count - 4)) as NSArray
        let path = NSString.path(withComponents: compoents as! [String])
        NSWorkspace.shared.launchApplication(path)
        NSApp.terminate(nil)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

