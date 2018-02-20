//
//  LoginSubController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class LoginSubController: NSViewController {
    @IBOutlet weak var autoLoginButton: HoverButton!   // 自动登录按钮
    @IBOutlet weak var remenberButton: HoverButton!   // 记住密码按钮
    var isRemSelected = false // 记录记住密码是否选中
    var isAutoSelected = false  // 记录自动登录是否选中
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        autoLoginButton.addHover(normalImageName: "cell_checkbox_normal", hoverImageName: "cell_checkbox_hover")
        remenberButton.addHover(normalImageName: "cell_checkbox_normal", hoverImageName: "cell_checkbox_hover")
    }
    
    // 点击记住密码按钮事件
    @IBAction func clickRember(_ sender: HoverButton) {
        isRemSelected = !isRemSelected
        let imgName = isRemSelected ? NSImage.Name("cell_checkbox_checked") :  NSImage.Name("cell_checkbox_normal")
        remenberButton.image = NSImage(named: imgName)
        
        if isRemSelected {
            remenberButton.updateNormalImageName(name: "cell_checkbox_checked")
        }else{
            remenberButton.updateNormalImageName(name: "cell_checkbox_hover")
        }
        
    }
    // 点击自动登录按钮事件
    @IBAction func clickAuto(_ sender: HoverButton) {
        isAutoSelected = !isAutoSelected
        let imgName = isAutoSelected ? NSImage.Name("cell_checkbox_checked") :  NSImage.Name("cell_checkbox_normal")
        autoLoginButton.image = NSImage(named: imgName)
        if isAutoSelected {
            autoLoginButton.updateNormalImageName(name: "cell_checkbox_checked")
        }else{
            autoLoginButton.updateNormalImageName(name: "cell_checkbox_hover")
        }
    }
}
