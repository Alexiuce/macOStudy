//
//  MessageViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

let MsgItemReusedKey = "msgKey"


class MessageViewController: NSViewController {

    @IBOutlet weak var subSplitView: NSSplitView!       // 右侧垂直方向的splitView
    @IBOutlet weak var baseSplitView: NSSplitView!     // 水平方向的splitView

    @IBOutlet weak var msgCollectionView: NSCollectionView!   // 左侧消息列表collectionView
    @IBOutlet weak var layout: NSCollectionViewFlowLayout!     // 消息列表布局属性
    
    
    @IBOutlet weak var chatTopView: NSView!   // 聊天消息顶部视图
    @IBOutlet weak var chatTopLabel: NSTextField!   // 聊天顶部label
    
    @IBOutlet weak var chatTableView: NSTableView!   // 聊天消息展示tableView
    
    @IBOutlet weak var toolBarView: NSView!    // 聊天工具栏视图
    
    @IBOutlet var chatTextView: NSTextView!   // 聊天文本编辑 TextView
    
    var msgArray = [MsgModel]()    // 消息数据数组,用来保存消息对象
    
    var chatArray = [ChatDataModel]()   // 聊天消息数据数组
    
    
    let baseDelegate = BaseSplitViewDelegate()
    let subDelegate = SubSplitDelegate()
    
    
    class func controller() -> MessageViewController{
        let vc = NSStoryboard.init(name: NSStoryboard.Name.init(rawValue: "message"), bundle: nil).instantiateInitialController() as! MessageViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.purple.cgColor
        // 1. 数据初始化
        setupData()
        // 2. UI初始化
        setupUI()
    }
}
// MARK: 初始化方法
extension MessageViewController{
    // 初始化数据
    fileprivate func setupData(){
        // 创建模型数据
        let msgData1 = MsgModel(headName: "test", username: "小强", message: "好好学习")
         let msgData2 = MsgModel(headName: "test1", username: "Job", message: "我爱地瓜")
         let msgData3 = MsgModel(headName: "test", username: "宝宝", message: "我饿了...")
         let msgData4 = MsgModel(headName: "test1", username: "爱疯x", message: "手机没电了")
         let msgData5 = MsgModel(headName: "test", username: "妞妞", message: "我最棒!!")
        
        msgArray.append(msgData1)
        msgArray.append(msgData2)
        msgArray.append(msgData3)
        msgArray.append(msgData4)
        msgArray.append(msgData5)
        
        // 2. 初始化聊天数据
        let chat1 = ChatDataModel(headIcon: "test1", username: "HaH", msgText: "good good study", type: .other)
        let chat2 = ChatDataModel(headIcon: "test", username: "我爱Mac", msgText: "来个笔记本", type: .me)
        chatArray.append(chat1)
        chatArray.append(chat2)
        
        
    }
    // 初始化UI
    fileprivate func setupUI(){
        baseSplitView.delegate = baseDelegate
        subSplitView.delegate = subDelegate
        // 设置collectionView
        setupCollectionView()
        // 设置chatTableView
        setuoChatView()
        // 设置聊天text 工具视图
        seupTextView()
    }
}
// MARK:  NSTableViewDataSource, NSTableViewDelegate
extension MessageViewController: NSTableViewDataSource, NSTableViewDelegate{
    // 返回行数
    func numberOfRows(in tableView: NSTableView) -> Int {
        return chatArray.count
    }
    // 返回每行的cell view
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("chatCell"), owner: self) as! ChatCellView
    
        // 将数据模型传递给cell
        cell.chatModel = chatArray[row]
        
        return cell
    }
    // 根据数据模型 计算每行不同的高度
//    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
//        return // 每行计算后的高度
//    }
    
}

extension MessageViewController: NSTextViewDelegate{
    // 监听text 按键事件处理
    func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector.description == "insertNewline:"{
            // 获取用户输入的内容
            let text = textView.string
            if text.isEmpty{return false}
            // 根据输入内容创建消息模型数据
            let chat = ChatDataModel(headIcon: "test", username: "myself", msgText: text, type: .me)
            chatArray.append(chat)
            // 刷新tableview
            chatTableView.reloadData()
            // 清空文本输入内容
            textView.string = ""
            // 设置消息tableview 滚动到最底部,展示最新消息
            
            let rect = chatTableView.rect(ofRow: chatArray.count - 1)  // 获取某一行的frame: 这里获取最后一行
            chatTableView.scroll(NSMakePoint(rect.origin.x, rect.origin.y))
        }
        return false
    }
}


// MARK: NSCollectionViewDataSource,NSCollectionViewDelegate
extension MessageViewController: NSCollectionViewDataSource,NSCollectionViewDelegate{
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return msgArray.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.init(MsgItemReusedKey), for: indexPath) as! MsgCollectionItem
        item.itemModel = msgArray[indexPath.item]
        return item
    }
   // collecitonView 选中的方法
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        guard let indexPath = indexPaths.first else { return  }
        let selectModel = msgArray[indexPath.item]
        chatTopLabel.stringValue = selectModel.name
        
    }
    
}

// MARK: 自定义方法
extension MessageViewController{
    fileprivate func setupCollectionView(){
        // 1. 设置collectionView每个item 的尺寸
        layout.itemSize = NSMakeSize(msgCollectionView.frame.width, 90)
        // 2. 注册collectionView item
        // 2.1 通过nib 加载item
        let itemNib = NSNib(nibNamed: NSNib.Name.init("MsgCollectionItem"), bundle: nil)
        msgCollectionView.register(itemNib, forItemWithIdentifier: NSUserInterfaceItemIdentifier.init(MsgItemReusedKey))
        // 3. 传递布局到splitview 的代理对象中,实时更新item的size
        baseDelegate.collectionLayout = layout
    }
    // 设置聊天消息列表展示
    fileprivate func  setuoChatView(){
        chatTableView.rowHeight = 80    // 如果计算不同行高,需要去除折行代码
        
        chatTableView.selectionHighlightStyle = .none  // 选中时,不高亮显示cell
        
        // 设置顶部视图的背景色
        chatTopView.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    // 设置聊天文本和工具视图
    fileprivate func  seupTextView(){
        toolBarView.wantsLayer = true
        toolBarView.layer?.backgroundColor = NSColor.white.cgColor
        // 遍历工具栏所有按钮
        for btn in toolBarView.subviews {
            // 获取按钮
            guard let itemButton = btn as? HoverButton else{continue}
            // 获取每个按钮的图片名称
            guard let imageName = itemButton.image?.name() else{continue}
            // 根据图片名称,生成新的hover 图片名
            let hoverName = (imageName.rawValue as NSString).replacingOccurrences(of: "normal", with: "hover")
            itemButton.addHover(normalImageName: imageName.rawValue, hoverImageName: hoverName)
            
        }
        
    }
}


