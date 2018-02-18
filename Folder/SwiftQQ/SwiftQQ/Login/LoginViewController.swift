//
//  LoginViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet weak var headButton: NSButton!
    @IBOutlet weak var passwordTextField: NSTextField!
    @IBOutlet weak var passwordButton: HoverButton!
    @IBOutlet weak var accountTextField: NSTextField!
    @IBOutlet weak var bg_imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.layer?.backgroundColor = NSColor.clear.cgColor
        headButton.layer?.cornerRadius = headButton.bounds.size.width * 0.5
 
    }
    
    @IBAction func clickLoginButton(_ sender: Any) {
        let homeController = NSStoryboard.init(name: NSStoryboard.Name(rawValue: "Home"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier.init(rawValue: "homeWindow")) as! HomeWindowController
        
        homeController.window?.makeKeyAndOrderFront(nil)
        view.window?.close()
        
    }
    
}

extension LoginViewController: NSTextFieldDelegate{
    override func controlTextDidChange(_ obj: Notification) {
        passwordButton.isHoverNormal = passwordTextField.stringValue.count > 0
        let imageName = passwordButton.isHoverNormal ? "icon-enter-normal" : "icon-enter-undo"
        let image = NSImage(named: NSImage.Name(rawValue: imageName))
        passwordButton.image = image
    }
}




