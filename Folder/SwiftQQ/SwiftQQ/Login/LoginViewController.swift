//
//  LoginViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet weak var passwordTextField: NSTextField!
    @IBOutlet weak var passwordButton: NSButton!
    @IBOutlet weak var accountTextField: NSTextField!
    @IBOutlet weak var bg_imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.layer?.backgroundColor = NSColor.clear.cgColor
        
    }
}

extension LoginViewController: NSTextFieldDelegate{
    override func controlTextDidChange(_ obj: Notification) {
        let imageName = passwordTextField.stringValue.count > 0 ? "icon-enter-normal" : "icon-enter-undo"
        let image = NSImage(named: NSImage.Name(rawValue: imageName))
        passwordButton.image = image
    }
}




