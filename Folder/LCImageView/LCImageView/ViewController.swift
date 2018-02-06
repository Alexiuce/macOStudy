//
//  ViewController.swift
//  LCImageView
//
//  Created by caijinzhu on 2018/2/6.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let headImage = NSImage(named: NSImage.Name(rawValue: "loginIcon"))!
        let headImageView = LCImageView(image: headImage)
        headImageView.frame = NSRect(x: 10, y: 20, width: 150, height: 150)
        
        view.addSubview(headImageView)
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

