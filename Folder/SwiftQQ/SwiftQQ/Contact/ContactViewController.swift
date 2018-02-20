//
//  ContactViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class ContactViewController: NSViewController {

    class func controller() -> ContactViewController{
        let vc = NSStoryboard.init(name: NSStoryboard.Name.init(rawValue: "contact"), bundle: nil).instantiateInitialController() as! ContactViewController
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.orange.cgColor
        // Do view setup here.
    }
    
}
