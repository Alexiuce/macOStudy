//
//  LoginViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet weak var accountTextField: NSTextField!
    @IBOutlet weak var bg_imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.layer?.backgroundColor = NSColor.clear.cgColor
    }
   
}

