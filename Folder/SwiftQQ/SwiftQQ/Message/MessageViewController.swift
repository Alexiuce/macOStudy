//
//  MessageViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//

import Cocoa

class MessageViewController: NSViewController {

    
    class func controller() -> MessageViewController{
        let vc = NSStoryboard.init(name: NSStoryboard.Name.init(rawValue: "message"), bundle: nil).instantiateInitialController() as! MessageViewController
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.brown.cgColor
        // Do view setup here.
    }
    
}
