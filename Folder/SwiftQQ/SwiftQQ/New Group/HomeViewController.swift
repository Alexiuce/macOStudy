//
//  HomeViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

let MessageKey = "message"
let ContactKey = "contact"
let MoreKey = "more"


class HomeViewController: NSViewController {

    @IBOutlet weak var containerView: NSView!
    
    @IBOutlet weak var messageButton: NSButton!   // 消息按钮
    @IBOutlet weak var contactButton: NSButton!     // 联系人按钮
    @IBOutlet weak var moreButton: NSButton!        // 更多按钮
    
    var controllerDict = [String : NSViewController]()   // 选项控制器字典
    var currentView = NSView()   // 当前显示的内容视图
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 数据初始化
        setupData()
        // 2. UI初始化
        setupUI()
    }
    // 点击消息选项卡
    @IBAction func clickMessage(_ sender: NSButton) {
        changeItemView(name: MessageKey, itemButton: sender)
    }
    // 点击联系人选项卡
    @IBAction func clickContact(_ sender: NSButton) {
        changeItemView(name: ContactKey, itemButton: sender)
    }
    // 点击更多选项卡
    @IBAction func clickMore(_ sender: NSButton) {
        changeItemView(name: MoreKey, itemButton: sender)
    }
}
// MARK: 初始化方法
extension HomeViewController{
    // 数据初始化
    fileprivate func setupData(){
        let messageVC = MessageViewController.controller()
        controllerDict[MessageKey] = messageVC
        let contactVC = ContactViewController.controller()
        controllerDict[ContactKey] = contactVC
        let moreVC = MoreViewController.controller()
        controllerDict[MoreKey] = moreVC
    }
    // UI初始化
    fileprivate func setupUI(){
        currentView.frame = view.bounds
        containerView.addSubview(currentView)
        // 默认选中消息选项卡
        clickMessage(messageButton)
    }
}
// MARK: 自定义方法
extension HomeViewController{
    // 更换选项内容视图
    fileprivate func  changeItemView(name: String, itemButton:NSButton){
        updateItemButton(name: name)
        // 1. 根据name参数,获取对应选项视图的控制器
        guard let currentVC = controllerDict[name]  else {return}
        
        // 1.1. 过滤重复点击
        if currentView == currentVC.view {return}
        
        // 2. 将视图控制器的view 添加到内容视图中
        containerView.replaceSubview(currentView, with: currentVC.view)
        // 2.1 设置当前视图为控制视图
        currentView = currentVC.view
        // 3. 设置当前内容视图的约束
        currentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    // 刷新选项按钮
    fileprivate func updateItemButton(name: String){
        messageButton.image = NSImage(named: NSImage.Name(rawValue: "menu-message-normal"))
        contactButton.image = NSImage(named: NSImage.Name(rawValue: "menu-contact-normal"))
        moreButton.image = NSImage(named: NSImage.Name(rawValue: "menu-more-normal"))
        if name == MessageKey {
             messageButton.image = NSImage(named: NSImage.Name(rawValue: "menu-message-down"))
        }else if name == ContactKey{
            contactButton.image = NSImage(named: NSImage.Name(rawValue: "menu-contact-down"))
        }else{
            moreButton.image = NSImage(named: NSImage.Name(rawValue: "menu-more-down"))
        }
        
    }
    
}

