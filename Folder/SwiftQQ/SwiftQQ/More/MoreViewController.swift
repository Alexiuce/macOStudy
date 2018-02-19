//
//  MoreViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//

import Cocoa

class MoreViewController: NSViewController {
    class func controller() -> MoreViewController{
        let vc = NSStoryboard.init(name: NSStoryboard.Name.init(rawValue: "more"), bundle: nil).instantiateInitialController() as! MoreViewController
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.red.cgColor
        // Do view setup here.
    }
    
}
