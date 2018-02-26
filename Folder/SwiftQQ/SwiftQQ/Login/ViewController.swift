//
//  ViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var passwordTextField: NSTextField!  // 密码输入控件
    @IBOutlet weak var downButton: HoverButton!
    @IBOutlet weak var passwordButton: HoverButton!   // 密码输入按钮
    @IBOutlet weak var headButton: NSButton!
    
    var isShowing = false   // 记录子窗口的显示状态
    
    lazy var subWindow : NSWindow = {
        // 1. 创建窗口
        let win = NSWindow(contentRect: NSZeroRect, styleMask: .fullSizeContentView, backing: NSWindow.BackingStoreType.buffered, defer: true)
        // 2. 设置窗口的contentController 属性
        let contrller = NSStoryboard.init(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier.init("subLogin")) as! LoginSubController
        win.contentViewController = contrller
        // 3. 返回窗口
        return win
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.clear.cgColor
      
        headButton.layer?.cornerRadius = headButton.bounds.size.width * 0.5
        passwordButton.addHover(normalImageName: "icon-enter-undo", hoverImageName: "icon-enter-hover")
        downButton.addHover(normalImageName: "Icon-Arrow-normal", hoverImageName: "Icon-Arrow-hover")
    }

   
    
    // 下拉按钮点击事件
    @IBAction func clickDownButton(_ sender: HoverButton) {
        // 1. 更新显示状态
        isShowing = !isShowing
        if isShowing{
            // 显示 子窗口
            // 设置窗口frame
            let subW = view.window!.frame.size.width
            let subH = CGFloat(100)
            let subX = view.window!.frame.origin.x
            let subY = view.window!.frame.origin.y - subH
            let rect = NSRect(x: subX, y: subY, width: subW, height: subH)
            subWindow.setFrame(rect, display: true)
            // 将窗口添加的window中
            view.window?.addChildWindow(subWindow, ordered: NSWindow.OrderingMode.below)
            
        }else{
            // 隐藏子窗口
            view.window?.removeChildWindow(subWindow)
            subWindow.setFrame(NSZeroRect, display: false)
        }
    }
    // 登录到主界面
    @IBAction func loginHome(_ sender: HoverButton) {
        // 1. 创建主界面窗口控制器
        let home = NSStoryboard.init(name: NSStoryboard.Name.init("Home"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier.init("home")) as! HomeWindowController
        let appDelegate = NSApp.delegate as! AppDelegate
        appDelegate.homeWindowController = home
        // 2 .显示主界面窗口
        home.window?.makeKeyAndOrderFront(nil)
        // 3 . 关闭登录窗口
        view.window?.close()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        // 1. 如果NSWindow 设置的是没有TitleBar 样式(或者无边框样式)时,keyWindow默认是nil
        // 也就是说: 无title Bar样式的NSWindow默认不会称为keyWindow
        // 会导致输入控件无法获取焦点:NSTextField,NSTextView 无法使用
        // 解决方案: 自定义一个NSWindow 重写方法canBecameKey 修改窗口的默认行为即可
    }
}

extension ViewController: NSTextFieldDelegate{
    /* 1. 监听NSTextField 内容变化*/
    override func controlTextDidChange(_ obj: Notification) {
        
      passwordButton.isHoverNormal = passwordTextField.stringValue.count > 0
        let imageName = passwordButton.isHoverNormal ? NSImage.Name("icon-enter-normal") : NSImage.Name("icon-enter-undo")
        passwordButton.image = NSImage(named: imageName)
    
    }
}

