//
//  AppDelegate.swift
//  SimuStartHelper
//
//  Created by Alexcai on 2018/9/4.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var mainIsRunning = false
        let mainAppId = "alexiuce.SimuLooker"
        NSWorkspace.shared.runningApplications.forEach {
            mainIsRunning = $0.bundleIdentifier == mainAppId
        }
        if mainIsRunning {  // 如果主应用已经启动,则退出helper
            NSApp.terminate(nil)
        }else{ // 如果主应用未启动,则启动主应用
    
            let path = Bundle.main.bundlePath
            
            let appPath = path.replacingOccurrences(of: "/Library/LoginItems/SimuStartHelper.app", with:"/MacOS/SimuLooker")
            if !FileManager.default.fileExists(atPath: appPath) {
                return;
            }
           let runningArray = NSRunningApplication.runningApplications(withBundleIdentifier: mainAppId)
            if (runningArray.count > 0) {
                return;
            }
            NSWorkspace.shared.launchApplication(appPath)
            NSApp.terminate(nil)
        }
        
       
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

