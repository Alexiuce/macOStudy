//
//  AboutViewController.swift
//  SimuLooker
//
//  Created by Alexcai on 2018/9/2.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {

    @IBOutlet weak var versionLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        guard let infoDict = Bundle.main.infoDictionary else {
            return;
        }
        
        let version = infoDict["CFBundleShortVersionString"] as! NSString
        versionLabel.stringValue = "Version \(version)"
    }
    
}
