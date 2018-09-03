//
//  TwoController.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/28.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa
import ServiceManagement

class AdvanceController: NSViewController {

    @IBOutlet var backgroundView: NSView!
    
    
    @IBOutlet weak var autoStartButton: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        self.preferredContentSize = view.frame.size
        
     
    }
    
    @IBAction func clickAutostartButton(_ sender: NSButton) {
        
        let isAutostart = sender.state == .on
        startupAppWhenLogin(startup: isAutostart)
        }
    
}

extension AdvanceController{
    fileprivate func  startupAppWhenLogin(startup: Bool) {
     
        let launcherAppIdentifier = "com.alexiuce.SimuLookerAutoStartHelper"
        
        let launcherAppPath = (Bundle.main.bundlePath as NSString).appendingPathComponent("Contents/Library/LoginItems/SimuLookerAutoStartHelper")
        
        if !FileManager.default.fileExists(atPath: launcherAppPath) {
            return
        }
        
        SMLoginItemSetEnabled(launcherAppIdentifier as CFString, startup);
    
    
    }
    

}

