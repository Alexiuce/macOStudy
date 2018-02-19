//
//  HomeViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/17.
//

import Cocoa

let MessageName = "message"
let ContactName = "contact"
let MoreName = "more"


class HomeViewController: NSViewController {

    var currentView = NSView()    // 当前显示的内容视图
    var currrentName = "" // 当前选中的选项卡名称
    
    @IBOutlet weak var containerView: NSView!
    
    var baseDict  = [String : NSViewController]()
    var imageDict = [String : NSImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 数据初始化
        setupData()
        // 2. UI初始化
        setupUI()
    }
    
    
    // 点击消息选项卡
    @IBAction func clickMessage(_ sender: NSButton) {
        changeContentView(name: MessageName,itemButton: sender)
    }
    // 点击联系人选项卡
    @IBAction func clickContact(_ sender: NSButton) {
         changeContentView(name: ContactName,itemButton: sender)
    }
    
    // 点击更多选项卡
    @IBAction func clickMore(_ sender: NSButton) {
        changeContentView(name: MoreName, itemButton: sender)
    }
    
    
}

extension HomeViewController{
    // 初始化加载数据
    fileprivate func setupData(){
        let messageVc = MessageViewController.controller()
        baseDict[MessageName] = messageVc
        let contactVc = ContactViewController.controller()
        baseDict[ContactName] = contactVc
        let moreVc = MoreViewController.controller()
        baseDict[MoreName] = moreVc
    }
    /* 根据选项卡,更换内容视图控制器 */
    fileprivate func changeContentView(name: String, itemButton: NSButton){
        
        guard let currentVc = baseDict[name] else { return  }
        containerView.replaceSubview(currentView, with: currentVc.view)
        currentView = currentVc.view
        addConstraint(targetView: currentView)
    }
    /* 给内容视图添加约束 */
    fileprivate func addConstraint(targetView: NSView){
//        targetView.translatesAutoresizingMaskIntoConstraints = false
        targetView.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalTo(0)
            make.edges.equalToSuperview()
        }
    }
    
    /* UI 界面初始化 */
    fileprivate func setupUI(){
        currentView.frame = view.bounds
        containerView.addSubview(currentView)
    }
    
}

